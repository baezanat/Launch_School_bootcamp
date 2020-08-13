=begin
Write a method that takes a sentence string as input, and returns the same string with any
sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
'nine' converted to a string of digits.
Example:
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

INPUT: string
OUTPUT: string with written-out numbers converted to digits
RULES: What about written-out words > 9?
DATA STRUCTURE: strings and arrays
ALGORITHM:
  - Write a conversion hash with written-out numbers as keys and string digits as values.
  - Iterate over hash keys with each
  - For each hash key, substitute it destructively in the string with the hash value at the corresponding key (use gsub! and regex with 'b' modifier to make sure only full words are compared and substituted, leaving punctuation as is.
  - return string (mutated)
=end

NUMBER_STRINGS = %w(zero one two three four five six seven eight nine)
STRING_DIGITS = (0..9).to_a.map { |num| num.to_s }
CONVERSION = NUMBER_STRINGS.zip(STRING_DIGITS).to_h

def word_to_digit(str)
  CONVERSION.keys.each do |word|
    str.gsub!(/\b#{word}\b/, CONVERSION[word])
  end
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
