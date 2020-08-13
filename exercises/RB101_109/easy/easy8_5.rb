=begin
Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

Examples:

palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

INPUT: string
OUTPUT: list of palindromes
RESTRICTIONS:
  - palindrome: same sequence of characters forward and backwards
    - at least 2 chars in size
  - arranged in same sequence as substrings appear in the string
  - Include duplicate palindromes
  - Case sensitive
ALGORITHM:
  - Use #substrings to get an array with all substrings
  - Remove single character substrings
  - Iterate over array and select substrings that are equal to self#reverse
=end

def substrings_at_start(str, beginning)
  char_arr = str.chars[beginning..-1]
  char_arr.map.with_index do |_, idx|
    char_arr[0..idx].join
  end
end

def substrings(str)
  result = []
  beginning = 0
  loop do
    break if beginning == str.length
    result << substrings_at_start(str, beginning)
    beginning += 1
  end
  result.flatten
end

def palindromes(str)
  array_substrings = substrings(str)
  array_substrings.delete_if { |substr| substr.size == 1 }
  array_substrings.select { |substr| substr == substr.reverse }
end

palindromes('abcd') == [] # => true
palindromes('madam') == ['madam', 'ada'] # => true
palindromes('hello-madam-did-madam-goodbye') == ['ll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada', 'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did', '-madam-', 'madam', 'ada', 'oo'] # => true
palindromes('knitting cassettes') == ['nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'] # => true
