class Player
  attr_accessor :move, :name

  def initialize
    @name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts ''
      puts "Choose #{Move::VALID_CHOICES[0..-2].join(', ')} or #{Move::VALID_CHOICES[-1]}:"
      choice = gets.chomp
      break if Move::VALID_CHOICES.include?(choice.downcase)
      puts "Invalid entry. Try again."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w(R2D2 Hal Chappie Sonny).sample
  end

  def choose
    self.move = Move.new(Move::VALID_CHOICES.sample)
  end
end

class Move
  VALID_CHOICES = %w(rock paper scissors)

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other)
    (rock? && other.scissors?) ||
      (paper? && other.rock?) ||
      (scissors? && other.paper?)
  end

  def <(other)
    (rock? && other.paper?) ||
      (paper? && other.scissors?) ||
      (scissors? && other.rock?)
  end

  def to_s
    @value
  end
end

class Score
  attr_accessor :human_score, :computer_score

  def initialize
    @human_score = 0
    @computer_score = 0
  end

  def update(human_player, computer_player)
    if human_player.move > computer_player.move
      self.human_score += 1
    elsif human_player.move < computer_player.move
      self.computer_score += 1
    end
  end
end

# ==================== GAME ORCHESTRATION ENGINE ======================

class RPSGame
  ROUNDS = 3

  attr_accessor :human, :computer, :scoreboard

  def initialize
    @human = Human.new
    @computer = Computer.new
    @scoreboard = Score.new
  end

  def set_names
    system('clear')
    puts ''
    human.set_name
    computer.set_name
  end

  def display_welcome_message
    puts ''
    puts "Welcome to #{Move::VALID_CHOICES.join(', ')}!"
    puts "The first to win #{ROUNDS} rounds is the grand winner."
  end

  def display_goodbye_message
    puts "Thanks for playing #{Move::VALID_CHOICES.join(', ')}. Good bye!"
  end

  def display_moves
    puts ''
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def update_score
    scoreboard.update(human, computer)
  end

  def display_round_winner
    if scoreboard.human_score > scoreboard.computer_score
      puts "#{human.name} won!"
    elsif scoreboard.human_score < scoreboard.computer_score
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    longer_name = 0
    longer_score = 1
    diff = 0
    adjust = ''
    if game_over?
      longer_name += 1
      longer_score += 1
      adjust = ' '
    end
    if human.name.size > computer.name.size
      longer_name = human.name.size
      diff = human.name.size - computer.name.size
      horizontal_line = "+-#{'-' * (longer_name + 10 + longer_score)}-+"
      score1 = "| #{human.name}'s score: #{scoreboard.human_score}#{adjust} |"
      score2 = "| #{computer.name}'s score: #{' ' * diff}#{scoreboard.computer_score}#{adjust} |"
    else
      longer_name = computer.name.size
      diff = computer.name.size - human.name.size
      horizontal_line = "+-#{'-' * (longer_name + 10 + longer_score)}-+"
      score1 = "| #{human.name}'s score: #{' ' * diff}#{scoreboard.human_score}#{adjust} |"
      score2 = "| #{computer.name}'s score: #{scoreboard.computer_score}#{adjust} |"
    end
    puts ''
    puts horizontal_line
    puts score1
    puts score2
    puts horizontal_line
  end

  def game_over?
    scoreboard.human_score == ROUNDS || scoreboard.computer_score == ROUNDS
  end

  def display_winner
    puts ''
    puts "************************************************"
    puts ''
    puts "Game over!"
    # puts "Final score:"
    # puts " #{human.name}: #{scoreboard.human_score}"
    # puts " #{computer.name}: #{scoreboard.computer_score}"
    if scoreboard.human_score == ROUNDS
      puts "#{human.name} is the grand winner!"
    else
      puts "#{computer.name} is the grand winner!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    return true if answer == 'y'
    false
  end

  def play
    set_names
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        update_score
        display_round_winner
        display_score
        break if game_over?
      end
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
