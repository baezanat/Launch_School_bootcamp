=begin
Write a method that takes a String of digits, and returns the appropriate
number as an integer. You may not use any #string_to_i or Integer.
Do not worry about leading + or - signs, nor should you worry about invalid
characters; assume all characters will be numeric.

INPUT: string with digits
OUTPUT: integer
REQUIREMENTS:
- no validation
- no leading + or - signs
DATA STRUCTURE:
- rules for conversion in a Hash
- String with individual digits
STRATEGY:
- split the string into an array called digits
- spell out the rules to convert all 10 digits in a Hash 
  {'1' => 1. '2' => 2, etc...}
- iterate over the array using #map using the digits as keys to get an array
  the corresponding values
- loop over the digits to get the sum for the final integer
=end

def string_to_integer(num_str)
  conversion = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
    '7' => 7, '8' => 8, '9' => 9, '0' => 0}
  digits = num_str.chars
  int_digits = digits.map {|str| conversion[str] }
  int = 0
  counter = 1
  loop do
    break if counter > int_digits.size
    int += (int_digits[counter * -1] * 10**(counter-1))
    counter += 1
  end
  return int
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
