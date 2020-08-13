=begin
VALUES = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10}

my_hand= [['H', '2'], ['S', 'J'], ['S', 'A']]

def evaluate(hand)
  non_a_cards = hand.select { |card| card[1] != 'A'}
  if hand.all? { |card| card[1] != 'A'}
    return hand.map { |card| VALUES[card[1]] }.sum
  elsif hand.flatten.count('A') >= 1
    number_a_cards = hand.flatten.count('A')
    non_a_cards_total = non_a_cards.map { |card| VALUES[card[1]] }.sum
    if non_a_cards_total + 10 + number_a_cards <= 21
      return non_a_cards_total + 10 + number_a_cards
    else
      return non_a_cards_total + number_a_cards
    end
  end
end

evaluate(my_hand)
=end


def display_hits(hand)
  hits = nil
  if hand.size - 2 == 1
    hits = "once"
  else
    hits = "#{(hand.size - 2)} times"
  end
  puts "The dealer hits #{hits}.\n\n"
end

hand = [[1], [2], [3]]
display_hits(hand)
hands = [[1], [2], [3], [4]]
display_hits(hands)
