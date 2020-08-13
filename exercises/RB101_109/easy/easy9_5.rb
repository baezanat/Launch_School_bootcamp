=begin
Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

Examples:

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
=end

def uppercase?(str)
  alphabetic_arr = str.chars.select { |char| char.match(/[a-z]/i) }
  alphabetic_arr.all? { |char| char.match(/[A-Z]/) }
end

uppercase?('t') == false # => true
uppercase?('T') == true # => true
uppercase?('Four Score') == false # => true
uppercase?('FOUR SCORE') == true # => true
uppercase?('4SCORE!') == true # => true
uppercase?('') == true # => true

# SIMPLER SOLUTION:

def uppercase_?(str)
  str == str.upcase
end

