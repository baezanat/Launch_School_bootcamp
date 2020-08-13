class GuessingGame
  attr_accessor :round, :guess, :secret_number
  attr_reader :min, :max

  def initialize(min, max)
    @min = min
    @max = max
    @max_guesses = Math.log2(max - min + 1).to_i + 1
    @round = 0
    @guess = nil
    @secret_number = set_secret_number
  end

  def play
    loop do
      display_remaining
      player_entry
      evaluate_entry
      break if game_over?
    end
    display_winner
  private

  def player_entry
    number = nil
    loop do
      puts "Enter a number between 1 and 100: "
      number = gets.chomp
      break if number.to_i.to_s == number && (1..100).include?(number.to_i)
      puts "Invalid guess. "
    end
    self.round += 1
    self.guess = number.to_i
  end

  def display_remaining
    puts ''
    puts "You have #{@max_guesses - round} guesses remaining."
  end

  def set_secret_number
    (min..max).to_a.sample
  end

  def evaluate_entry
    case
    when guess < secret_number
      puts "Your guess is too low."
    when guess > secret_number
      puts "Your guess is too high."
    when player_wins
      self.round = @max_guesses
      puts "That's the number!"
    end
  end

  def game_over?
    round == @max_guesses
  end

  def player_wins
    guess == secret_number
  end

  def display_winner
    puts ''
    if player_wins
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end
end

guess = GuessingGame.new(1, 100)
guess.play
