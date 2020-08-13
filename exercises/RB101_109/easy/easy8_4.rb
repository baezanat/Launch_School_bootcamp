=begin
Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the substrings_at_start method you wrote in the previous exercise:

Examples:

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

INPUT: string
OUTPUT: array of ordered strings
RESTRICTIONS:
  - print in order (shortest to longest) with each line having a different starting point (from first character in first line onward)
  - empty string returns empty string?
ALGORITHM:
  - Modify substrings_at_start to take in a second argument identifying the starting character for substrings
    - Change the array over which the method iterates to a slice beginning with the second argument parameter
  - Iterate over input string and apply substrings_at_start with each charcter as a starting point
  - Concatenate the arrays of substrings or flatten the overarching array
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

substrings('abcde') # => ["a", "ab", "abc", "abcd", "abcde", "b", "bc", "bcd", "bcde", "c", "cd", "cde", "d", "de", "e"]
