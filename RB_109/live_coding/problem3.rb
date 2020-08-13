=begin
Write a function insert_dash(num) that will insert dashes ('-') between each two odd numbers in num. 
For example: if num is 454793 the output should be '4547-9-3'. Don't count zero as an odd number.

Note that the number will always be non-negative (>= 0).

INPUT: int
OUTPUT: string
DATA STRUCTURE: string and array
ALGORITHM:
  - convert int to string and use #chars to create an array of digits
  - iterate over the array keeping track of index
  - check if each character is odd && the character with index +1 is also odd
  - if so, insert dash at index + 1 (this mutates the array)
  - return array.join
=end

def insert_dash(int)
  digits = int.to_s.chars
  digits.each_with_index do |digit, index|
    if digit.to_i.odd? && digits[index + 1].to_i.odd?
      digits.insert(index + 1, '-')
    end
  end
  digits.join
end



def insert_dash(integer)
  previous = false
  result = []

  integer.digits.reverse.each_with_index do |int, index|
    if int.odd? && previous
      result << '-' << int.to_s
    elsif int.odd? && !previous
      previous = true
      result << int.to_s
    else
      previous = false
      result << int.to_s
    end
  end
  
  result.join
end

p insert_dash(454793) == "4547-9-3"
p insert_dash(6571980) == "65-7-1-980"
p insert_dash(657803) == "65-7803"
p insert_dash(0) == "0"
p insert_dash(1) == "1"

