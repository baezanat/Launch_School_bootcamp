require 'io/console'
require 'pry'
require 'pry-byebug'

SUITS = ['Clubs', 'Spades', 'Hearts', 'Diamonds']
CARDS = ['1', '2', '3', '4', '5', '6', '7', '8',
         '9', '10', 'Jack', 'Queen', 'King', 'Ace']
VALUES = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
           '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
           'Jack' => 10, 'Queen' => 10, 'King' => 10 }
ROUNDS = 3
POINTS_TO_WIN = 21
MAX_DEALER_HITS = 17

def prompt(msg)
  puts "=> #{msg}"
end

def welcome
  system('clear')
  prompt "Welcome to #{POINTS_TO_WIN}!\n\n"
  prompt "The first to win #{ROUNDS} rounds is the grand winner.\n\n"
end

def initialize_deck
  deck_of_cards = []
  SUITS.each do |suit|
    CARDS.each do |value|
      deck_of_cards << Array.new([suit, value])
    end
  end
  deck_of_cards
end

def deal_card(cards, hand)
  if hand.empty?
    2.times { hand << cards.delete(cards.sample) }
  else
    new_card = cards.delete(cards.sample)
    hand << new_card
    new_card
  end
end

def card_names(hand)
  if hand.size == 1
    "#{hand[0][1]} of #{hand[0][0]}"
  else
    name_array = hand.map { |card| "#{card[1]} of #{card[0]}" }
    first = name_array[0..-2].join(', ')
    last = " and #{name_array[-1]}"
    first + last
  end
end

def display_card(new)
  prompt "You drew #{card_names([new])}.\n\n"
end

def display(hand, whose)
  if whose == 'player'
    prompt "Your cards are #{card_names(hand)}.\n\n"
  elsif whose == 'dealer'
    prompt "The dealer's cards are #{card_names(hand)}.\n\n"
  end
end

def show_dealer_card(hand)
  prompt "Dealer shows the #{card_names([hand.sample])}.\n\n"
end

def hit_or_stay?
  answer = nil
  loop do
    prompt "Enter 'h' to hit or 's' to stay.\n\n"
    answer = gets.chomp.downcase
    break if answer.start_with?('h', 's')
    prompt "Invalid answer."
  end
  answer
end

def hand_with_a?(hand)
  hand.flatten.count('Ace') >= 1
end

def evaluate_no_a(hand)
  hand.map { |card| VALUES[card[1]] }.sum
end

def evaluate_with_a(hand)
  non_a_cards = hand.select { |card| card[1] != 'Ace' }
  number_a_cards = hand.flatten.count('Ace')
  non_a_cards_total = non_a_cards.map { |card| VALUES[card[1]] }.sum
  if non_a_cards_total + 10 + number_a_cards <= POINTS_TO_WIN
    non_a_cards_total + 10 + number_a_cards
  else
    non_a_cards_total + number_a_cards
  end
end

def evaluate(hand)
  if hand_with_a?(hand)
    evaluate_with_a(hand)
  else
    evaluate_no_a(hand)
  end
end

def reveal(total)
  prompt "Your current total is #{total}.\n\n"
end

def bust?(total)
  total > POINTS_TO_WIN
end

def display_bust(total, whose)
  if whose == 'player'
    prompt "Round is over; you busted!\n\n"
  elsif whose == 'dealer'
    prompt "Round is over! The dealer busts with a total of #{total}.\n\n"
  end
end

def dealer_turn(cards, hand)
  if evaluate(hand) <= MAX_DEALER_HITS
    loop do
      deal_card(cards, hand)
      break if evaluate(hand) >= MAX_DEALER_HITS
    end
  end
end

def display_hits(hand)
  hits = if hand.size - 2 == 1
           "once"
         else
           "#{(hand.size - 2)} times"
         end
  prompt "The dealer hits #{hits}.\n\n"
end

def stay_and_win(winner, loser)
  winner <= POINTS_TO_WIN && winner > loser
end

def determine_round_winner(player, dealer)
  if bust?(player) || stay_and_win(dealer, player)
    'dealer'
  elsif bust?(dealer) || stay_and_win(player, dealer)
    'player'
  else
    'tie'
  end
end

def update(scores, player, dealer)
  if determine_round_winner(player, dealer) == 'player'
    scores['player'] += 1
  elsif determine_round_winner(player, dealer) == 'dealer'
    scores['dealer'] += 1
  end
end

def display_points(player, dealer)
  prompt "Results -- You: #{player}; Dealer: #{dealer}.\n\n"
end

def display_round_results(player, dealer)
  if determine_round_winner(player, dealer) == 'player'
    prompt "You win!\n\n"
  elsif determine_round_winner(player, dealer) == 'dealer'
    prompt "The dealer wins.\n\n"
  else
    prompt "It's a tie!\n\n"
  end
end

# rubocop:disable Metrics/LineLength
def show(scores)
  prompt "Scoreboard -- You: #{scores['player']}, Dealer: #{scores['dealer']}.\n\n"
end
# rubocop:enable Metrics/LineLength

def next_round
  prompt "Press any key to start the next round."
  STDIN.getch
  system("clear")
end

def match_winner?(scores)
  scores['player'] == ROUNDS || scores['dealer'] == ROUNDS
end

def display_match_winner(scores)
  if scores['player'] == ROUNDS
    prompt "Game over! You are the grand winner!\n\n"
  elsif scores['dealer'] == ROUNDS
    prompt "Game over! The dealer wins.\n\n"
  end
end

def play_again?
  prompt "Press 'y' to play again or any other key to quit."
  gets.chomp.downcase.start_with?('y')
end

def good_bye
  prompt "Thank you for playing. Good-bye!\n\n"
end

# ================================ GAME LOOP ===================================

loop do
  welcome
  scoreboard = Hash.new(0)

  loop do
    deck = initialize_deck
    player_total = nil
    dealer_total = nil

    loop do
      players_hand = Array.new
      deal_card(deck, players_hand)
      display(players_hand, 'player')
      player_total = evaluate(players_hand)
      reveal(player_total)
      dealers_hand = Array.new
      deal_card(deck, dealers_hand)
      show_dealer_card(dealers_hand)

      loop do
        player = hit_or_stay?
        if player.start_with?('s')
          player_total = evaluate(players_hand)
          break
        end
        system('clear')
        new = deal_card(deck, players_hand)
        display_card(new)
        display(players_hand, 'player')
        player_total = evaluate(players_hand)
        reveal(player_total)
        if bust?(player_total)
          display_bust(player_total, 'player')
          break
        end
      end
      break if bust?(player_total)

      dealer_turn(deck, dealers_hand)
      display_hits(dealers_hand)
      display(dealers_hand, 'dealer')
      dealer_total = evaluate(dealers_hand)
      if bust?(dealer_total)
        display_bust(dealer_total, 'dealer')
        break
      end
      display_points(player_total, dealer_total)
      break
    end

    determine_round_winner(player_total, dealer_total)
    display_round_results(player_total, dealer_total)
    update(scoreboard, player_total, dealer_total)
    show(scoreboard)
    if match_winner?(scoreboard)
      display_match_winner(scoreboard)
      break
    end
    next_round
  end
  break unless play_again?
end
good_bye
