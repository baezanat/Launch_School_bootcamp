=begin
Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive
duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.
Examples:
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

INPUT: str
OUTPUT: modified str
DATA STRUCTURE: str
ALGORITHM:
  - create empty arr
  - split string using chars
  - iterate over array of chars using #each_with_index
    - arr << char[i] if char[i] != char[ir-1]
  - arr.join
=end

def crunch(str)
  if str == ''
    return str
  else
    non_repeat_array = []
    char_array = str.chars
    char_array.each_with_index do |char, index|
      if char != char_array[index + 1]
        non_repeat_array << char
      end
    end
    return non_repeat_array.join
  end
end                                              # => :crunch

def crunch2(str)
  str.gsub(/(.)\1+/, '\1')  # => "daily double", "4abcabcba", "g", "a", ""
end                         # => :crunch2

crunch2('ddaaiillyy ddoouubbllee') == 'daily double'  # => true
crunch2('4444abcabccba') == '4abcabcba'               # => true
crunch2('ggggggggggggggg') == 'g'                     # => true
crunch2('a') == 'a'                                   # => true
crunch2('') == ''                                     # => true
