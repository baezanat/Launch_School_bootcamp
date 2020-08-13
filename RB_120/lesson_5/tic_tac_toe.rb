require 'io/console'
require 'pry'
require 'pry-byebug'

module Displayable
  def prompt(message)
    puts "=> #{message}"
  end

  def clear
    system 'clear'
  end
end

class Board
  INITIAL_MARKER = ' '
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]

  attr_accessor :squares

  def initialize
    @squares = (1..9).zip(1..9).to_h
  end

  def reset
    squares.each { |key, _| squares[key] = INITIAL_MARKER }
  end

  # rubocop:disable Metrics/AbcSize
  def display
    puts ''
    puts "     |     |"
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
    puts "     |     |"
    puts ''
  end
  # rubocop:enable Metrics/AbcSize

  def empty_keys
    squares.select { |_, marker| marker == INITIAL_MARKER }.keys
  end

  def full?
    empty_keys.empty?
  end

  def someone_won?
    !!winning_marker?
  end

  def markers_at_winning_lines
    WINNING_LINES.map do |line|
      squares.values_at(*line)
    end
  end

  def winning_marker?
    marks = markers_at_winning_lines
    marks.each do |arr|
      if arr.min == arr.max && arr[0] != INITIAL_MARKER
        return arr[0]
      end
    end
    nil
  end

  def key_square(whose)
    WINNING_LINES.map do |line|
      marks = squares.values_at(*line)
      if marks.count(whose) == 2 && marks.count(INITIAL_MARKER) == 1
        return line[marks.index(INITIAL_MARKER)]
      end
    end
    nil
  end

  def can_win?(who)
    !!key_square(who)
  end
end

class Player
  include Displayable

  attr_accessor :marker, :score, :name, :current_player

  def initialize
    @score = 0
  end

end

class Human < Player
  def choose_marker
    choice = nil
    loop do
      puts ''
      prompt "Please choose a marker: 'X' or 'O'"
      choice = gets.chomp.upcase
      break if ['X', 'O'].include?(choice)
      prompt "Sorry, that's not a valid choice."
    end
    self.marker = choice
  end

  def enter_name
    answer = ''
    loop do
      puts ''
      prompt "Please enter your name: "
      answer = gets.chomp
      break unless answer.empty? || answer == ' '
      puts ''
      prompt "Invalid entry."
    end
    self.name = answer
  end

  def choose_first_player?
    answer = ''
    loop do
      puts ''
      prompt "Would you like to choose who plays first? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts ''
      prompt "Invalid entry."
    end
    answer == 'y'
  end
end

class Computer < Player
  def initialize
    super
    set_name
  end

  def define_marker(other)
    self.marker = if other == 'X'
                    'O'
                  else
                    'X'
                  end
  end

  def set_name
    self.name = %w(R2D2 Scrappy Ilia UQZ).sample
  end

  def thinking
    puts ''
    puts ''
    prompt "#{name} is choosing..."
    prompt "Press any key to continue."
    STDIN.getch
    clear
  end

end

# ================ ORCHESTRATION ENGINE =================

class TTTGame
  include Displayable

  ROUNDS = 3

  attr_reader :human, :computer, :squares, :marker
  attr_accessor :board, :round

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @round = 1
  end

  def play
    start_new_game
    loop do
      loop do
        loop do
          current_players_turn
          break if board.someone_won? || board.full?
        end
        display_round_results
        break if game_over?
        set_new_round
      end
      display_winner
      break unless play_again?
      set_new_game
    end
    display_goodbye_message
  end

  private

  def start_new_game
    display_welcome_message
    set_names
    set_first_player
    set_markers
    instructions
  end

  def set_new_game
    set_new_round
    human.score = 0
    computer.score = 0
  end

  def set_names
    human.enter_name
    puts ''
    prompt "You will be playng against #{computer.name}.\n\n"
  end

  def chosen_first_player
    first = ''
    loop do
      puts ''
      prompt "Who goes first? (1: #{human.name}/ 2: #{computer.name})"
      first = gets.chomp.to_i
      break if [1, 2].include?(first)
      puts ''
      prompt "Invalid entry; must be 1 or 2.\n"
    end
    first
  end

  def set_chosen
    case chosen_first_player
    when 1
      human.current_player = true
      computer.current_player = false
    else
      human.current_player = false
      computer.current_player = true
    end
  end

  def set_first_player
    if human.choose_first_player?
      set_chosen
    else
      human.current_player = [true, false].sample
      computer.current_player = !human.current_player
      display_first_player
    end
  end

  def display_first_player
    if human.current_player == true
      puts ''
      prompt "#{human.name} will go first.\n\n"
    else
      puts ''
      prompt "#{computer.name} will go first.\n\n"
    end
  end

  def toggle_player
    human.current_player = !human.current_player
    computer.current_player = !computer.current_player
  end

  def current_players_turn
    current_player_moves
    display_new_move
  end

  def current_player_moves
    if human.current_player
      human_moves
    else
      computer_moves
    end
    toggle_player
  end

  def display_new_move
    clear
    puts ''
    prompt "You're a #{human.marker}; #{computer.name} is a #{computer.marker}."
    puts ''
    board.display
  end

  def display_welcome_message
    clear
    puts ''
    prompt "Welcome to Tic Tac Toe!\n\n\n"
    prompt "The first to win #{ROUNDS} rounds is the grand winner.\n\n"
  end

  def display_goodbye_message
    puts ''
    prompt "Thanks for playing, #{human.name}. Goodbye!"
    puts ''
  end

  def choices_string
    if board.empty_keys.size == 1
      board.empty_keys[0].to_s
    else
      "#{board.empty_keys[0..-2].join(', ')} or #{board.empty_keys[-1]}"
    end
  end

  def choose_square
    square = nil
    puts ''
    prompt "Please choose a square: #{choices_string}\n"
    loop do
      square = gets.chomp.to_i
      break if board.empty_keys.include?(square)
      prompt "Sorry, that's not a valid choice."
    end
    square
  end

  def instructions
    puts ''
    prompt "The squares are numbered as follows: "
    board.display
    board.reset
  end

  def set_markers
    human.choose_marker
    computer.define_marker(human.marker)
  end

  def human_moves
    board.squares[choose_square] = human.marker
  end

  def computer_moves
    computer.thinking
    computer_chooses_move
  end

  def offensive
    return nil unless board.can_win?(computer.marker)
    board.key_square(computer.marker)
  end

  def defensive
    return nil unless board.can_win?(human.marker)
    board.key_square(human.marker)
  end

  def central
    return 5 if board.squares[5] == Board::INITIAL_MARKER
  end

  def random
    board.empty_keys.sample
  end

  def computer_chooses_move
    square = offensive || defensive || central || random
    computer_chooses(square)
  end

  def computer_chooses(square)
    board.squares[square] = computer.marker
  end

  def display_round_winner
    puts "\n\n"
    case board.winning_marker?
    when human.marker
      human.score += 1
      prompt "You win!"
    when computer.marker
      computer.score += 1
      prompt "#{computer.name} wins!"
    else
      prompt "It's a tie!"
    end
  end

  # rubocop:disable Metrics/AbcSize
  def display_scores
    scr = [human.score.to_s.size, computer.score.to_s.size].max
    adjust = ' ' * (human.name.size - computer.name.size).abs
    if human.name.size > computer.name.size
      horizontal_line = " +-#{'-' * (human.name.size + 10 + scr)}-+"
      score1 = " | #{human.name}'s score: #{human.score} |"
      score2 = " | #{computer.name}'s score: #{adjust}#{computer.score} |"
    else
      horizontal_line = " +-#{'-' * (computer.name.size + 10 + scr)}-+"
      score1 = " | #{human.name}'s score: #{adjust}#{human.score} |"
      score2 = " | #{computer.name}'s score: #{computer.score} |"
    end
    puts "\n#{horizontal_line}\n#{score1}\n#{score2}\n#{horizontal_line}"
  end
  # rubocop:enable Metrics/AbcSize

  def display_round_results
    display_round_winner
    display_scores
  end

  def set_new_round
    self.round += 1
    puts ''
    prompt "Let's play again!\n\n"
    prompt "Press any key to start round #{round}."
    STDIN.getch
    clear
    set_first_player
    board.reset
  end

  def play_again?
    answer = ''
    loop do
      puts ''
      prompt "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      prompt "Invalid entry."
    end
    answer == 'y'
  end

  def game_over?
    human.score == ROUNDS || computer.score == ROUNDS
  end

  def display_winner
    if human.score == ROUNDS
      puts ''
      prompt "#{human.name} is the grand winner!\n\n"
    else
      puts ''
      prompt "#{computer.name} is the grand winner!\n\n"
    end
  end
end

game = TTTGame.new
game.play
