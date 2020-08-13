=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples:

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

INPUT: string (word)
OUTPUT: boolean
DATA STRUCTURE: strings and arrays
RULES:
  - only one letter per block can be used
  - each block can be used only once (no words with repeated letters)
  - return true if the word can be spelled
    - has no repeated letters
    - has only one letter from each pair (block)
  - case insensitive
ALGORITHM:
  - initialize a constant BLOCKS and assign to it a hash object with the two letters in each block as key-value pairs
  - change the input string to an array using #chars
  - iterate over the array using #all? and check for each character that if it is equal to one of the keys in the BLOCKS hash, then the value associated with that key is not included in the string. If it is included, return false.
  - Check that there are no repeated characters in the string. To do this, iterate over the array using #count and return false if element#count returns a number > 1.
  - If neither of the above conditions returns false, then return true.
=end

BLOCKS = {'B' => 'O','X' => 'K','D' => 'Q','C' => 'P','N' => 'A','G' => 'T','R' => 'E','F' => 'S','J' => 'W','H' => 'U','V' => 'I','L' => 'Y','Z' => 'M'}

def non_repeated_block_letters(str)
  letters = str.upcase.chars
  letters.all? do |letter|
    ((BLOCKS.keys.include?(letter) && !letters.include?(BLOCKS[letter])) ||
      (BLOCKS.values.include?(letter) && !letters.include?(BLOCKS.key(letter))))
  end
end

def non_repeated_letters(str)
  letters = str.upcase.chars
  letters.all? { |letter| str.upcase.count(letter) == 1 }
end

def block_word?(str)
  non_repeated_block_letters(str) && non_repeated_letters(str)
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
