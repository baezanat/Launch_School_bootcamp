# Constants
VALID_CHOICES = %w(r p s l k)
ROUNDS_TO_WIN = 5
WINNING_COMBINATIONS = {
  'p' => ['r', 'k'],
  'r' => ['s', 'l'],
  's' => ['p', 'l'],
  'k' => ['r', 's'],
  'l' => ['k', 'p']
}
CHART = {
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'l' => 'lizard',
  'k' => 'spoke'
}

# Methods
def prompt(message)
  puts "=> #{message}"
end

def display_legend
  legend = <<-LEG
    Rock............r       Paper............p
    Scissors........s       Lizard...........l
    Spoke...........k
  LEG
  puts legend
end

def welcome
  prompt("Welcome to Rock-Paper-Scissors-Lizard-Spoke!")
  prompt("The first to win #{ROUNDS_TO_WIN} rounds wins.\n\n")
  prompt("**********************************************\n\n")
  prompt("Choose one of the following: #{VALID_CHOICES.join(', ')}")
  display_legend
end

def win?(first, second)
  WINNING_COMBINATIONS[first].include?(second)
end

def display_choices(player, computer)
  prompt("You chose #{CHART[player]}; computer chose #{CHART[computer]}.")
end

def display_winner(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def update_scoreboard(score, player, computer)
  score[:player] += 1 if win?(player, computer)
  score[:computer] += 1 if win?(computer, player)
end

def display_scoreboard(score)
  prompt("Your score is #{score[:player]}; computer score is #{score[:computer]}.")
end

def match_ended?(score, num_rounds)
  score[:player] == num_rounds || score[:computer] == num_rounds
end

def display_match_winner(score, num_rounds)
  if score[:computer] == num_rounds
    prompt("Game over! The computer is the grand winner!")
  elsif score[:player] == num_rounds
    prompt("Game over! You are the grand winner!")
  end
end

require 'io/console'
def continue_playing
  prompt("Press any key to start the next round.")
  STDIN.getch
  system("clear")
end

# Initialize local variables
player_choice = ''
score = {
  player: 0,
  computer: 0
}

system("clear")

loop do
  welcome
  loop do
    player_choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(player_choice)
    prompt("Invalid choice; try again.")
  end

  computer_choice = VALID_CHOICES.sample

  display_choices(player_choice, computer_choice)
  display_winner(player_choice, computer_choice)
  update_scoreboard(score, player_choice, computer_choice)
  display_scoreboard(score)
  if match_ended?(score, ROUNDS_TO_WIN)
    display_match_winner(score, ROUNDS_TO_WIN)
    break
  else
    prompt("The first to get #{ROUNDS_TO_WIN} wins is the grand winner.")
    continue_playing
  end
end

prompt("Thank you for playing. Good bye!")
