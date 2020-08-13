=begin
Write a method that takes a String of digits, and returns the appropriate number as an integer.
The String may have a leading + or - sign; if the first character is a +, your method should return a positive number;
if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.
Examples:
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

INPUT: string
OUTPUT: negative or positive integer
RESTRICTIONS:
	. If input has no sign, it's a positive number.
	- If 0, return 0.
	- No validation needed
STRATEGY:
	- Check if number is prepended with a sign
		- If not, use string_to_integer function (from previous exercise)
		- If prepended with +, slice it off and use string_to_integer function
		- If prepended with -, slice it off, use string_to_integer function and multiply the returned integer by -1.

=end

def string_to_signed_integer(num_str)
  conversion = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
    '7' => 7, '8' => 8, '9' => 9, '0' => 0}
  digits = num_str.chars
  sign = 1
  if digits[0] == '+'
  	digits.shift
  elsif digits[0] == '-'
  	sign *= -1
  	digits.shift
  end
  int_digits = digits.map {|str| conversion[str] }
  int = 0
  counter = 1
  loop do
    break if counter > int_digits.size
    int += (int_digits[counter * -1] * 10**(counter-1))
    counter += 1
  end
  return int * sign
end

p string_to_signed_integer('4321') #== 4321
p string_to_signed_integer('-570') #== -570
p string_to_signed_integer('+100') #== 100
p string_to_signed_integer('0') #== 0
p string_to_signed_integer('+3420') #== 3420