=begin
Write a method that will return a substring based on specified indices.

substring('honey', 0, 2) == 'hon'
substring('honey', 1, 2) == 'on'
substring('honey', 3, 9) == 'ey'
substring('honey', 2) == 'n'

INPUT: string, num1(index1), num2(index2)
OUTPUT: string
RULES:
  - return a string slice from index1 to index2 (inclusive)
  - if index2 >= string.size, return slice to end of string (no errors, no nil)
  - if only one number is specified, use it also as second numeric argument
DATA STRUCTURE= strings and arrays
ALGORITHM:
  -return string[index1..index2]
  -set the second numeric parameter to default to the same value as the first if no value is entered
=end

def substring(str, index1, index2 = index1)
  str[index1..index2]
end

# p substring('honey', 0, 2) == 'hon'
# p substring('honey', 1, 2) == 'on'
# p substring('honey', 3, 9) == 'ey'
# p substring('honey', 2) == 'n'

# Write a method that finds all the substrings in a string. No 1 letter words.
# INPUT: string
# OUTPUT: array of strings
# RULES:
#   - no 1 letter words
#   - strings can be repeated
# ALGORITHM:
#   - initiate an empty result string
#   - initiate a counter1 and set it to 0
#   - manual loop
#     - break if counter1 >= str.size
#     - set counter2 = 0
#     - loop
#       - break if counter2 >= str.size
#       - result << str[counter1..counter2]
#       - counter2 += 1
#     - end
#     counter1 +=1
#   - end loop
#   - return result array

def substrings(str)
  result = []
  counter1 = 0
  loop do
    break if counter1 >= str.size
    counter2 = counter1
    loop do
      break if counter2 >= str.size
      result << str[counter1..counter2]
      counter2 += 1
    end
    counter1 += 1
  end
  result.select { |str| str.size > 1 }
end

# Another algorithm:
#   - initiate an empty result array
#   - set counter = 0
#   loop do
#     - break if counter >= str.size
#     - new_str = str[counter..-1]
#     - new_str.size.times do |i|
#       - result << str[counter..i]
#     -counter += 1
#   - return result

def substrings2(str)
  result = []
  counter = 0
  p str
  loop do
    break if counter == str.size - 1
    new_string = str[counter..-1]
    (new_string.size - 1).times do |i|
      result << new_string[0..i + 1]
    end
    counter += 1
  end
  p result
  result
end

p substrings2('band')# == ['ba', 'ban', 'band', 'an', 'and', 'nd']
p substrings2('world') == ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rl', 'rld', 'ld']
p substrings2('ppop')# == ['pp', 'ppo', 'ppop', 'po', 'pop', 'op']

