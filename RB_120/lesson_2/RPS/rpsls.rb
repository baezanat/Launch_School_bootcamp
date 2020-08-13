require "io/console"

class Player
  CHOICES = %w(rock paper scissors lizard spock)

  attr_accessor :name, :history, :score
  attr_reader :move

  def initialize
    @history = []
    @score = 0
  end

  def move=(value)
    @move = case value
            when 'rock'
              Rock.new
            when 'paper'
              Paper.new
            when 'scissors'
              Scissors.new
            when 'lizard'
              Lizard.new
            when 'spock'
              Spock.new
            end
    @history << @move
  end

  def self.update_score(player1, player2)
    if player1.move > player2.move
      player1.score += 1
    elsif player1.move < player2.move
      player2.score += 1
    end
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts " What's your name?"
      n = gets.chomp
      break unless n.strip.empty?
      puts " Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "\n Choose #{CHOICES[0..-2].join(', ')} or #{CHOICES[-1]}:"
      choice = gets.chomp.downcase
      break if CHOICES.include?(choice)
      puts " Invalid entry. Try again."
    end
    self.move = choice
  end
end

class R2D2 < Player
  def set_name
    self.name = 'R2D2'
  end

  # always chooses rock
  def choose
    self.move = 'rock'
  end
end

class Hal < Player
  def set_name
    self.name = 'Hal'
  end

  # high tendency to choose scissors and rarely rock
  def choose
    choices = CHOICES.dup
    choices.fill('scissors', 5, 10).fill(%w(paper lizard spock), 15, 2).flatten!
    self.move = choices.sample
  end
end

class Chappie < Player
  def set_name
    self.name = 'Chappie'
  end

  # always chooses spock or lizard
  def choose
    self.move = %w(spock lizard).sample
  end
end

class Sonny < Player
  def set_name
    self.name = 'Sonny'
  end

  # truly random choice among all options
  def choose
    self.move = CHOICES.sample
  end
end

class Move
  def to_s
    @value
  end
end

class Rock < Move
  def initialize
    @value = 'rock'
  end

  def >(other)
    other.class == Scissors || other.class == Lizard
  end

  def <(other)
    other.class == Paper || other.class == Spock
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
  end

  def >(other)
    other.class == Rock || other.class == Spock
  end

  def <(other)
    other.class == Scissors || other.class == Lizard
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
  end

  def >(other)
    other.class == Paper || other.class == Lizard
  end

  def <(other)
    other.class == Rock || other.class == Spock
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
  end

  def >(other)
    other.class == Paper || other.class == Spock
  end

  def <(other)
    other.class == Scissors || other.class == Rock
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
  end

  def >(other)
    other.class == Rock || other.class == Scissors
  end

  def <(other)
    other.class == Paper || other.class == Lizard
  end
end

# ==================== GAME ORCHESTRATION ENGINE ======================

class RPSGame
  ROUNDS = 3

  def play
    set_player_name
    display_welcome_message
    loop do
      new_round
      loop do
        players_choose
        display_moves
        show_results
        break if game_over?
        start_new_round
      end
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
  end

  def set_player_name
    system('clear')
    puts ''
    human.set_name
  end

  def new_round
    set_computer
    reset_score
    human.history = []
    system 'clear'
  end

  def players_choose
    human.choose
    computer.choose
  end

  def show_results
    update_score
    display_round_winner
    display_score
    print_history
  end

  def set_computer
    random = %w(R2D2 Hal Chappie Sonny).sample
    @computer = case random
                when 'R2D2'
                  R2D2.new
                when 'Hal'
                  Hal.new
                when 'Chappie'
                  Chappie.new
                when 'Sonny'
                  Sonny.new
                end
    computer.set_name
  end

  def reset_score
    human.score = 0
  end

  def update_score
    Player.update_score(human, computer)
  end

  def display_round_winner
    if human.move > computer.move
      puts "\n #{human.name} won!"
    elsif human.move < computer.move
      puts "\n #{computer.name} won!"
    else
      puts "\n It's a tie!"
    end
  end

  # rubocop:disable Metrics/AbcSize
  def display_score
    sc = [human.score.to_s.size, computer.score.to_s.size].max
    d = ' ' * (human.name.size - computer.name.size).abs
    if human.name.size > computer.name.size
      horizontal_line = " +-#{'-' * (human.name.size + 10 + sc)}-+"
      score1 = " | #{human.name}'s score: #{human.score} |"
      score2 = " | #{computer.name}'s score: #{d}#{computer.score} |"
    else
      horizontal_line = "+-#{'-' * (computer.name.size + 10 + sc)}-+"
      score1 = " | #{human.name}'s score: #{d}#{human.score} |"
      score2 = " | #{computer.name}'s score: #{computer.score} |"
    end
    puts "\n#{horizontal_line}\n#{score1}\n#{score2}\n#{horizontal_line}"
  end
  # rubocop:enable Metrics/AbcSize

  def print_history
    puts ''
    puts " #{computer.name}'s moves: #{computer.history.join(', ')}"
    puts " #{human.name}'s moves: #{human.history.join(', ')}"
  end

  def display_welcome_message
    puts ''
    puts " Welcome to #{Player::CHOICES.join(', ')}!"
    puts " The first to win #{ROUNDS} rounds is the grand winner."
  end

  def display_goodbye_message
    puts " Thanks for playing #{Player::CHOICES.join(', ')}. Good bye!"
  end

  def display_moves
    puts ''
    puts " #{human.name} chose #{human.move}."
    puts " #{computer.name} chose #{computer.move}."
  end

  def start_new_round
    puts "\n Press any key to start the next round."
    STDIN.getch
    system 'clear'
  end

  def game_over?
    human.score == ROUNDS || computer.score == ROUNDS
  end

  def display_winner
    puts ''
    puts "************************************************"
    puts " Game over!"
    if human.score == ROUNDS
      puts " #{human.name} is the grand winner!"
    else
      puts " #{computer.name} is the grand winner!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts " Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts " Sorry, must be y or n."
    end
    return true if answer == 'y'
    false
  end
end

RPSGame.new.play
