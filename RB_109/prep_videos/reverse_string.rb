=begin
Write a program that reverses a string without using String#reverse!
INPUT: string
OUTPUT: modified string (reversed)
EXAMPLES:
reverser('hello') == 'olleh'
reverser('') == ''
reverser('Aya') == ('ayA')
RULES:
  - don't use reverse method
  - same object or new String object?
DATA STRUCTURE: strings and arrays
ALGORITHM:
  - Initialize an empty results string
  - Start counter for manual loop at string.size
  - loop do
    - counter -= 1
    - result << string[counter]
      break if counter == 0
  - return string
=end
require 'pry'
require 'pry-byebug'

def reverser(str)
  result = ''
  counter = str.size
  loop do
    break if counter == 0
    counter -= 1
    result << str[counter]
  end
  result
end

p reverser('hello') == 'olleh'
p reverser('') == ''
p reverser('Aya') == ('ayA')

# Now write a method that reverses in place (mutates the object)
#
# ALGORITHM:
# . convert string to array 
# - use indexed assignment (mutating with respect to the string)
#   str[str.size - 1] == array[0]
#   str[str.size - 2] == array[1]
#   str[0] == array [array.size - 1]
#   Iterate over the array with index and set each element in the string at [-index - 1] equal to array[index]
# - return the string

def reverser!(str)
  array = str.chars
  array.each_with_index do |_, index|
    str[-index-1] = array[index]
  end
  str
end

p reverser!('hello') == 'olleh'
p reverser!('') == ''
p reverser!('Aya') == ('ayA')
