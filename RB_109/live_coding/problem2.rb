=begin
This time no story, no theory. The examples below show you how to write function accum:

Examples:

accum("abcd") == "A-Bb-Ccc-Dddd"
accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
accum("cwAt") == "C-Ww-Aaa-Tttt"

The parameter of accum is a string which includes only letters from a..z and A..Z.

INPUT: string
OUTPUT: string with repeated letters and dashes
RULES:
  - first char is capitalized
  - second char capitalized and doubled
  - third char capitalized and repeated 3 times
  => capitalized and repeated, lowercase, (index +1) times
  
  - insert dashes between repeated characters

DATA STRUCTURE: string and array
ALGORITHM:
  - Initialize an empty result array
  - Convert string to array of chars using #chars
  - Iterate over array keeping track of index, for each char do the following:
    - upcase and push into result
    - downcase and push into result index number of times
    - push dash into result
  - pop last element from result
  - return result.join
=end

def accum(str)
  result = []
  char_array = str.chars
  char_array.each_with_index do |char, index|
    result << char.upcase
    index.times { result << char.downcase }
    result << '-'
  end
  result.pop
  result.join
end

p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("cwAt") == "C-Ww-Aaa-Tttt"
