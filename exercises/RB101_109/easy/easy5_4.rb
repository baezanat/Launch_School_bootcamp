=begin
Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which
the first and last letters of every word are swapped.
You may assume that every word contains at least one letter, and that the string will always contain at least one word.
You may also assume that each string contains nothing but words and spaces

Examples:
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

INPUT: string
OUTPUT: modified string
DATA STRUCTURE: string --> array --> string
ALGORITHM:
  - split string to get an array of words
  - iterate over the array and swap the first and last letters
  - join with a space between words
=end

def swap (str)
  words_arr = str.split                   # => ["Oh", "what", "a", "wonderful", "day", "it", "is"], ["Abcde"], ["a"]
  swapped_arr = words_arr.each do |word|  # => ["Oh", "what", "a", "wonderful", "day", "it", "is"], ["Abcde"], ["a"]
    first = word[0]                       # => "O", "w", "a", "w", "d", "i", "i", "A", "a"
    last = word[-1]                       # => "h", "t", "a", "l", "y", "t", "s", "e", "a"
    word[0] = last                        # => "h", "t", "a", "l", "y", "t", "s", "e", "a"
    word[-1] = first                      # => "O", "w", "a", "w", "d", "i", "i", "A", "a"
  end                                     # => ["hO", "thaw", "a", "londerfuw", "yad", "ti", "si"], ["ebcdA"], ["a"]
  swapped_arr.join(' ')                   # => "hO thaw a londerfuw yad ti si",                     "ebcdA",   "a"
end                                       # => :swap


swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'  # => true
swap('Abcde') == 'ebcdA'                                                  # => true
swap('a') == 'a'                                                          # => true
