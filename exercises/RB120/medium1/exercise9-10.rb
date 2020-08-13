require 'pry'
require 'pry-byebug'

class Deck
  attr_accessor :cards

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = full_deck.shuffle
  end

  def full_deck
    deck = []
    RANKS.product(SUITS).each do |card_arr|
      deck << Card.new(card_arr[0], card_arr[1])
    end
    deck
  end

  def draw
    self.cards = full_deck.shuffle! if cards.empty?
    cards.pop
  end
end

class PokerHand < Deck

  attr_accessor :cards

  def initialize(cards)
    if cards.class == Array
      @cards = cards
    elsif cards.class == Deck
      @cards = deal_hand(cards)
    end
  end

  def deal_hand(deck)
    cards = []
    5.times { cards << deck.draw }
    cards
  end

  def print
    cards.each { |card| puts card }
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def ranks_in_hand
    ranks = []
    cards.each { |card| ranks << card.rank }
    ranks
  end

  def suits_in_hand
    suits = []
    cards.each { |card| suits << card.suit }
    suits
  end

  def values_in_hand
    values = []
    cards.each { |card| values << card.value }
    values
  end

  def unique_suit?
    suits_in_hand.uniq.size == 1
  end

  def sequence?
    min = values_in_hand.min
    ([min, min + 1, min + 2, min + 3, min + 4] - values_in_hand).empty?
  end

  def equal_rank
    ranks_in_hand.map { |rank| ranks_in_hand.count(rank) }
  end

  def royal_flush?
    ranks = (ranks_in_hand.all? do |rank|
             [10, 'Jack', 'Queen', 'King', 'Ace'].include?(rank)
            end)
    ranks && unique_suit?
  end

  def straight_flush?
    sequence? && unique_suit?
  end

  def four_of_a_kind?
    equal_rank.include?(4)
  end

  def full_house?
    ([3, 2] - equal_rank).empty?
  end

  def flush?
    unique_suit? && !sequence?
  end

  def straight?
    !unique_suit? && sequence?
  end

  def three_of_a_kind?
    !full_house? && equal_rank.include?(3)
  end

  def two_pair?
    equal_rank.count(2) == 4
  end

  def pair?
    equal_rank.count(2) == 2
  end
end

class Card
  include Comparable
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = rank_value_hash[@rank]
  end

#   def <=>(other_card)
#     value <=> other_card.value
#   end

  private

  def to_s
    "#{rank} of #{suit}"
  end
  
  def rank_value_hash
    value_per_rank = (2..10).to_a.zip((2..10).to_a).to_h
    value_per_rank['Jack'] = 11
    value_per_rank['Queen'] = 12
    value_per_rank['King'] = 13
    value_per_rank['Ace'] = 14
    value_per_rank
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate
# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
