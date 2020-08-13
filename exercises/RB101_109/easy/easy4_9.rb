=begin
Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc.
Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Examples:
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

INPUT: integer
OUTPUT: string
RESTRICTIONS:
	- Negative numbers
	- no Ruby standard conversion methods
DATA STRUCTURE:
STRATEGY:
	- Get digits from number using a recursive function
		- last = num % 10
		- tens = (num % 100 - num % 10) / 10
		- hundreds = (num % 1000 - num % 100) / 100

	- Use a conversion hash to get strings from each digit
	- Join the digit-strings into a single string
=end

def integer_to_string(int)
  return '0' if int == 0
  conversion = {1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8',
    9 => '9', 0 => '0'}
  digits = []
  counter = 1
  loop do
    break if counter > int
    current_digit = (int % (counter *10) - int % counter) / counter
    digits << current_digit
    counter *= 10
  end
  digits.reverse.map { |digit| conversion[digit]}.join
end

p integer_to_string(4326) == '4326'
p integer_to_string(4321) == '4321'
p integer_to_string(0) =='0'
p integer_to_string(5000) == '5000'
