=begin
The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

valid? : check if valid Luhn number
checksum: return the checksum, or the remainder from using the Luhn method.
addends: add a check digit to make the number valid, return the original number plus that digi

INPUT: integer

Valid?
- OUTPUT: boolean
Algorithm:
- digits = Use #digits to get an array of integers in reverse order
- new = iterate over digits keeping track of index (use #map.with_index) and multiply by 2 each item in an odd numbered index. If the result is >= 10, subtract 9.
- Use #sum or #inject(:+) to get the sum of the array
- if the sum % 10 == 0, return true. Otherwise, return false.

addends:
- INPUT: non-Luhn number
- OUTPUT: Array of possible checksum digits to add in order to make the input number a valid Luhn number
Algorithm:
- Append 0 to input number and get the checksum.
- Create a new array with every number in the range between the result checksum..checksum + 9
- Iterate over this array and select all valid Luhn numbers.
=end

class Luhn
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def addends
    Luhn.addends(num)
  end

  def self.create(numb)
    new = numb.digits.unshift(0).reverse.join.to_i
    (new..new + 9).to_a.select { |n| Luhn.valid?(n) }.first
  end

  def checksum
    Luhn.checksum(num)
  end

  def valid?
    return true if checksum % 10 == 0
    false
  end

  private

  def self.addends(n)
    n.digits.map.with_index do |digit, index|
      if index.even?
        digit
      else
        digit * 2 >= 10 ? (digit * 2) - 9 : digit * 2
      end
    end.reverse
  end

  def self.checksum(n)
    Luhn.addends(n).sum
  end

  def self.valid?(n)
    return true if Luhn.checksum(n) % 10 == 0
    false
  end
end

