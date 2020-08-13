=begin
Write a program that will convert a trinary number, represented as a string (e.g. '102012'), to its decimal equivalent using first principles (without using an existing method or library that can work with numeral systems).

Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary entries should convert to decimal number 0.

The last place in a trinary number is the 1's place. The second to last is the 3's place, the third to last is the 9's place, etc.

# "102012"
    1       0       2       0       1       2    # the number
1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
  243 +     0 +    54 +     0 +     3 +     2 =  302

Input: string with digits
Output: integer (decimal)
Algorithm:
  - switch to integer and then use #digits to get an array of integers in reverse order
  - iterate using #map and keeping track of index (#with_index) and multiply each digit by (3 ** index), then get the sum of all numbers in the resulting array.
=end

class Trinary
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if !valid?
    arr = num.to_i.digits
    arr.map.with_index { |n, idx| n * (3 ** idx) }.sum
  end

  private

  def valid?
    num.chars.each { |n| %w(0 1 2).include? n }
  end

end

