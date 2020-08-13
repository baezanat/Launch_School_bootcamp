=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer
that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.
INPUT: integer
OUTPUT: printed diamond (side-effect, return irrelevant)
DATA STRUCTURE: string
RULES:
  - four-pointed diamond
  - n x n grid
  - n always odd
  - if n == 1, print one star
ALGORITHM:
    - initialize a variable for the number of spaces and another for the stars
    - Use a loop and in each new round decrease spaces by 1 and increase stars by 2
    until stars == n
    - Add a new loop increasing the number of spaces by 1 and decreasing stars by 2
    until stars == 1
=end

def upper_diamond(number)
  stars = 1
  spaces = (number - 1) / 2
  loop do
    puts " " * spaces + "*" * stars
    break if spaces == 0
    spaces -= 1
    stars += 2
  end
end

def lower_diamond(number)
  spaces = 0
  stars = number
  loop do
    spaces += 1
    stars -= 2
    puts " " * spaces + "*" * stars
    break if stars == 1
  end
end

def diamond(number)
  if number == 1
    puts '*'
  elsif number > 1
    upper_diamond(number)
    lower_diamond(number)
  end
end

diamond(1)
diamond(3)
diamond(9)
