module Displayable
  def prompt(message)
    puts "=> #{message}"
  end

  def clear
    system('clear')
  end
end

module Hand
  def hand_display
    if hand.size == 1
      string_one_card
    elsif hand.size == 2
      string_2_cards
    else
      string_many_cards
    end
  end

  def show_hand
    puts ''
    puts horizontal_bar
    puts "   #{self}'s hand: #{hand_display}"
    puts horizontal_bar
  end

  def show_one_card
    puts ''
    prompt "#{self} shows a #{hand.pop}."
  end

  def total
    if hand_includes_a? && adjust_points_for_a?
      total_unadjusted + 10
    else
      total_unadjusted
    end
  end

  def show_total
    puts ''
    prompt "#{self}'s total: #{total}"
  end

  private

  def adjust_points_for_a?
    total_unadjusted <= 11
  end

  def hand_includes_a?
    hand.any? { |card| card.value == 'A' }
  end

  def total_unadjusted
    hand.map(&:points).sum
  end

  def string_one_card
    hand[0].to_s
  end

  def string_2_cards
    "#{hand[0]} and #{hand[1]}"
  end

  def string_many_cards
    "#{hand[0..-2].join(', ')} and #{hand[-1]}"
  end

  def horizontal_bar
    '-' * (name.size + 15 + hand_display.to_s.size)
  end
end

class Card
  attr_accessor :value, :suit, :points

  def set_points
    self.points = for_a || for_jqk || for_num
  end

  private

  def to_s
    "#{value} of #{suit}"
  end

  def for_a
    return nil unless value == 'A'
    1
  end

  def for_jqk
    return nil unless %w(J Q K).include?(value)
    10
  end

  def for_num
    return nil unless %w(2 3 4 5 6 7 8 9).include?(value)
    value.to_i
  end
end

class Deck
  attr_accessor :cards

  def initialize
    reset
  end

  def reset
    self.cards = full_deck
  end

  def deal_one_card
    card = cards.sample
    cards.delete(card)
  end

  private

  def full_deck
    full_deck = []
    suits = %w(hearts diamonds clubs spades)
    values = %w(2 3 4 5 6 7 8 9 J Q K A)
    deck_array = values.product(suits)
    deck_array.each do |card_array|
      card = Card.new
      card.value = card_array[0]
      card.suit = card_array[1]
      card.set_points
      full_deck << card
    end
    full_deck.shuffle!
  end
end

class Participant
  include Displayable
  include Hand

  attr_accessor :name, :hand, :stay, :hits

  def initialize
    @hand = []
    @stay = false
    @hits = 0
  end

  def reset
    self.hand = []
    self.hits = 0
    self.stay = false
  end

  def display_turn_results
    display_result
    puts "   #{self}'s hand: #{hand_display}"
    puts "   Total points: #{total}\n"
  end

  def busted?
    total > 21
  end

  def end_turn
    return false unless stay || busted?
    clear
    true
  end

  def win(other)
    total <= 21 && ((21 - total).abs < (21 - other.total).abs)
  end

  private

  def to_s
    name
  end

  def result
    if busted?
      'busts'
    elsif stay == true
      'stays'
    end
  end

  def display_result
    puts ''
    puts ''
    if hits == 0
      prompt "#{self} doesn't hit and #{result} right away."
    elsif hits == 1
      prompt "#{self} hits once and #{result}."
    else
      prompt "#{self} hits #{hits} times and #{result}."
    end
  end
end

class Player < Participant
  def set_name
    name = ''
    loop do
      puts ''
      prompt "Please enter your name: "
      name = gets.chomp
      break if !name.empty?
      prompt "Invalid entry."
    end
    self.name = name
  end

  def hit_or_stay?
    move = ''
    loop do
      puts ''
      prompt "Would you like to hit or stay? (h/s)"
      move = gets.chomp.downcase
      break if %w(h s).include? move
      prompt "Invalid entry, must be 'h' or 's'."
    end
    move
  end
end

class Dealer < Participant
  def initialize
    super
    @name = choose_name
  end

  def choose_name
    self.name = %w(R2D2 Chappie Iron Ilya Elettra).sample
  end
end

class Game
  include Displayable

  attr_accessor :name, :deck, :hand
  attr_reader :dealer, :player

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    start_game
    loop do
      deal_initial_cards
      loop do
        player_turn
        break if player.end_turn
      end
      player.display_turn_results
      dealer_turn
      display_winner
      break unless play_again?
      set_new_game
    end
    display_goodbye_message
  end

  private

  def display_winner
    puts ''
    puts '****************************************************************'
    puts ''
    case winner
    when dealer
      prompt "#{dealer} wins!"
    when player
      prompt "#{player} wins!"
    else
      prompt "It's a tie!"
    end
  end

  def winner
    if player.busted? || dealer.win(player)
      dealer
    elsif dealer.busted? || player.win(dealer)
      player
    end
  end

  def dealer_turn
    return nil if player.busted?
    loop do
      hit(dealer)
      break if dealer.total >= 17
    end
    dealer.stay = true
    dealer.display_turn_results
  end

  def player_turn
    if player.hit_or_stay? == 'h'
      player_hits
    else
      player.stay = true
    end
  end

  def player_hits
    prompt "#{player} chooses to hit."
    hit(player)
    clear
    puts ''
    puts ''
    prompt "#{player} draws a #{player.hand[-1]}.\n"
    puts ''
    player.show_hand
    puts ''
    player.show_total
  end

  def hit(who)
    who.hand << deck.deal_one_card
    who.hits += 1
  end

  def deal_initial_cards
    deal_cards
    show_initial_cards
  end

  def show_initial_cards
    puts ''
    prompt "Initial cards are dealt."
    player.show_hand
    player.show_total
    dealer.show_one_card
  end

  def deal_cards
    deal_first_cards(dealer)
    deal_first_cards(player)
  end

  def deal_first_cards(whose)
    2.times { whose.hand << deck.deal_one_card }
  end

  def start_game
    display_welcome_message
    player.set_name
    display_dealer_name
  end

  def display_dealer_name
    puts ''
    prompt "You will be playing against #{dealer}."
  end

  def display_welcome_message
    clear
    puts ''
    puts ''
    prompt "Welcome to 21!"
  end

  def display_goodbye_message
    puts ''
    prompt "Thank you for playing, #{player.name}. Goodbye!\n\n"
  end

  def play_again?
    answer = ''
    loop do
      puts ''
      prompt "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      prompt "Invalid entry; must be 'y' or 'n'."
    end
    answer == 'y'
  end

  def set_new_game
    deck.reset
    player.reset
    dealer.reset
    dealer.name
    clear
    puts ''
    display_dealer_name
  end
end

Game.new.start
