class Card
  include Comparable
  attr_reader :rank, :suit, :value, :suit_value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = rank_value_hash[@rank]
    @suit_value = suit_points[@suit.downcase]
  end

  def <=>(other)
    return value <=> other.value unless (value <=> other.value) == 0
    suit_value <=> other.suit_value
  end

  private

  def to_s
    "#{rank} of #{suit}"
  end
  
  def rank_value_hash
    first_part = (2..10).to_a.zip((2..10).to_a).to_h
    second_part = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}
    first_part.merge(second_part)
  end

  def suit_points
    {'spades' => 1, 'hearts' => 2, 'clubs' => 3, 'diamonds' => 4 }
  end
end

cards = [Card.new(2, 'Hearts'),
Card.new(10, 'Diamonds'),
Card.new(2, 'Clubs')]
puts cards
puts cards.min
