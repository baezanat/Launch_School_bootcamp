def joinor(arr, connector1 = ',', connector2 = 'or')
  first = arr[0..-2].map { |e| e.to_s }.join(" #{connector1}")
  last = "#{connector1} #{connector2} #{arr[-1]}."
  return "#{first}#{last}"
end

joinor([1, 2])
joinor([1, 2, 3])
joinor([1, 2, 3], ';')
joinor([1, 2, 3], ',', 'and')


loop do
display_board(board)
place_piece!(board, current_player)
current_player = alternate_player(current_player)
break if someone_won?(board) || board_full?(board)
end

-------

def place_piece!(brd, plr)
  if plr == 'player'
    player_places_piece(brd)
  elsif plr == 'computer'
    computer_places_piece(brd)
  end
end


# ============================= OLD GAME LOOP ==============================

welcome

loop do
  scoreboard = Hash.new(0)
  first_player = determine_first_player
  continue_playing

  loop do
    board = initialize_board

    if first_player == 'player'
      loop do
        display_board(board)
        player_places_piece!(board)
        break if winner?(board) || full?(board)
        computer_places_piece!(board)
        break if winner?(board) || full?(board)
      end

    elsif first_player == 'computer'
      loop do
        computer_places_piece!(board)
        display_board(board)
        break if winner?(board) || full?(board)
        player_places_piece!(board)
        break if winner?(board) || full?(board)
      end

    end

    display_board(board)
    display_round_result(board)
    update_score(scoreboard, board)
    display_match_score(scoreboard)
    if game_over?(scoreboard)
      display_winner(scoreboard)
      break
    end
    continue_playing
# THE COMPUTER IS NOT ALWAYS FILLING THE SQUARE TO WIN (WHEN HAVING TWO MARKS IN A ROW IN WINNING LINE)
  end

  prompt("Enter 'y' to play again or any other key to exit.")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
  continue_playing
end

prompt("Thank you for playing. Good bye!")
---------------------------------------------------------------------

def find_at_risk_square(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      line.select { |num| brd[num] == INITIAL_MARKER }.pop
    end
  end
end

def find_square_to_win(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      line.select { |num| brd[num] == INITIAL_MARKER }.pop
    end
  end
end

def computer_places_piece!(brd)
  random = empty_squares(brd).sample
  at_risk_square = nil
  square_to_win = nil
  WINNING_LINES.each do |line|
    square_to_win = find_square_to_win(line, brd)
    break if square_to_win
  end
  WINNING_LINES.each do |line|
    at_risk_square = find_at_risk_square(line, brd)
    break if at_risk_square
  end
  if square_to_win
    brd[square_to_win] = COMPUTER_MARKER
  elsif at_risk_square
    brd[at_risk_square] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    brd[random] = COMPUTER_MARKER
  end
end
