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

class Card
  include Comparable
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = rank_value_hash[@rank]
  end

  def <=>(other_card)
    value <=> other_card.value
  end

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

deck = Deck.new
p deck.cards.size
p deck.cards.count { |card| card.rank == 5 } == 4
p deck.cards.count { |card| card.suit == 'Hearts' } == 13
p deck.cards.count { |card| card.suit == 'Clubs' } == 13
p deck.cards.count { |card| card.suit == 'Diamonds' } == 13
p deck.cards.count { |card| card.suit == 'Spades' } == 13
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13
p drawn.count { |card| card.suit == 'Clubs' } == 13
p drawn.count { |card| card.suit == 'Diamonds' } == 13
p drawn.count { |card| card.suit == 'Spades' } == 13
drawn2 = []
p 52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
