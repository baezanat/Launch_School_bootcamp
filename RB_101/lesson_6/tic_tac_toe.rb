require 'io/console'

FIRST_PLAYER = 'choose'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
ROUNDS = 3

def prompt(msg)
  puts "=> #{msg}"
end

def welcome
  system('clear')
  prompt("Welcome to tic tac toe!\n\n")
  prompt("The first to win #{ROUNDS} rounds is the grand winner.\n\n")
end

def determine_first_player
  if FIRST_PLAYER == 'player'
    'player'
  elsif FIRST_PLAYER == 'computer'
    'computer'
  else
    prompt("Who will go first? ('c' for computer, any other key for you)\n\n")
    answer = gets.chomp.downcase
    if answer == 'c'
      return 'computer'
    else
      return 'player'
    end
  end
end

def alternate_player(plr)
  if plr == 'computer'
    'player'
  elsif plr == 'player'
    'computer'
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system('clear')
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each do |num|
    new_board[num] = INITIAL_MARKER
  end
j  new_board
end

def empty_squares(brd)
  brd.keys.select { |square| brd[square] == INITIAL_MARKER }
end

def joinor(arr, connector1 = ',', connector2 = 'or')
  first = arr[0..-2].map(&:to_s).join("#{connector1} ")
  last = "#{connector1} #{connector2} #{arr[-1]}."
  if arr.size == 1
    return arr[0]
  elsif arr.size == 2
    return "#{arr[0]} #{connector2} #{arr[1]}."
  else
    return "#{first}#{last}"
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Invalid number. Try again.")
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line.select { |num| brd[num] == INITIAL_MARKER }.pop
    end
  end
  nil
end

def find_square_to_win(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return line.select { |num| brd[num] == INITIAL_MARKER }.pop
    end
  end
  nil
end

def center_square(brd)
  return 5 if brd[5] == INITIAL_MARKER
end

def computer_places_piece!(brd)
  square = find_square_to_win(brd) ||
           find_at_risk_square(brd) ||
           center_square(brd) ||
           empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, plr)
  if plr == 'player'
    player_places_piece!(brd)
  elsif plr == 'computer'
    computer_places_piece!(brd)
  end
end

def full?(brd)
  empty_squares(brd).empty?
end

def winner?(brd)
  detect_winner(brd) ? true : false
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "You"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def display_round_result(brd)
  if winner?(brd)
    prompt("#{detect_winner(brd)} won!\n\n")
  else
    prompt("It's a tie!\n\n")
  end
end

def update_score(scores, brd)
  if detect_winner(brd) == "You"
    scores[:player] += 1
  elsif detect_winner(brd) == "Computer"
    scores[:computer] += 1
  end
end

def display_match_score(scores)
  prompt("Score -- You: #{scores[:player]}, Computer: #{scores[:computer]}\n\n")
end

def game_over?(scores)
  scores[:player] == ROUNDS || scores[:computer] == ROUNDS
end

def display_winner(scores)
  if scores[:player] == ROUNDS
    prompt("Game over! You are the grand winner.")
  elsif scores[:computer] == ROUNDS
    prompt("Gave over! The computer wins.")
  end
end


def play_again?
  prompt("Enter 'y' to play again or any other key to exit.")
  gets.chomp.downcase
end

def start_next_round
  prompt("Press any key to start a new round.")
  STDIN.getch
  system("clear")
end

# ============================= GAME LOOP ==============================

welcome

loop do
  scoreboard = Hash.new(0)
  current_player = determine_first_player

  loop do
    board = initialize_board

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if winner?(board) || full?(board)
    end

    display_board(board)
    display_round_result(board)
    update_score(scoreboard, board)
    display_match_score(scoreboard)
    if game_over?(scoreboard)
      display_winner(scoreboard)
      break
    end
    start_next_round
  end

  continue = play_again?
  break unless continue.start_with?('y')
  system("clear")
end

prompt("Thank you for playing. Good bye!")

