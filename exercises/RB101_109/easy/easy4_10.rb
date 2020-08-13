=begin
In the previous exercise, you developed a method that converts non-negative numbers to strings.
Extend that method to represent negative numbers as well.
Write a method that takes an integer, and converts it to a string representation.
You may not use any of the standard conversion methods available in Ruby,
such as Integer#to_s, String(), Kernel#format, etc. You may, however, use
integer_to_string from the previous exercise.

Examples
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

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

def signed_integer_to_string(int)
  if int < 0
    integer_to_string(-int).prepend('-')
  elsif int > 0
    integer_to_string(int).prepend('+')
  else
    integer_to_string(int)
  end
end

def signed_integer_to_string_refactored(int)
  return '0' if int == 0
  "#{int > 0 ? '+' : '-'}#{integer_to_string(int.abs)}"
end

p signed_integer_to_string_refactored(4321) == '+4321'
p signed_integer_to_string_refactored(-123) == '-123'
p signed_integer_to_string_refactored(0) == '0'
