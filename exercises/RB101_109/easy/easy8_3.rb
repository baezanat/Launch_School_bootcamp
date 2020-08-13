=begin
Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

Examples:

substrings_at_start('abc') == ['a', 'ab', 'abc']
substrings_at_start('a') == ['a']
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

INPUT: str
OUTPUT: arr
ALGORITHM:
  - Use #chars to make an array of characters
  - iterate over array with #map and concatenate all elements up to each current element during iteration
=end

def substrings_at_start(str)
  char_arr = str.chars
  char_arr.map.with_index do |_, idx|
    char_arr[0..idx].join
  end
end

substrings_at_start('abc') == ['a', 'ab', 'abc'] # => true
substrings_at_start('a') == ['a'] # => true
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy'] # => true
