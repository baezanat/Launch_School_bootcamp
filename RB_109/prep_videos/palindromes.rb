=begin
Write a method that finds the largest substring that is a palindrome within a string

INPUT: string
OUTPUT: array of strings
RULES:
  - palindromes are words that are the same in reverse
  - find all palindromes within a string
  - empty string?
  - if no palindromes, return empty string
DATA STRUCTURE: strings, arrays
ALGORITHM:
  - firt, find all substrings within a string, then find palindromes, then find the largest palindrome

Find all substrings in a string
  - input: string
  - initialize empty result array
  - iterate over the string keeping track of index
    (string.size - index - 1).times do |i|
    - add string[index..index + 1 + i] to result
  - return result

Method to see if a string is a palindrome
  - check if string == string.reverse

Method to find all palindromes
  - Find all substrings
  - Use Array#select to get all substrings that are palindromes

Method to find the largest palindrome
  - use max_by and check for palindrome.size
=end

def substrings(str)
  result = []
  str.chars.each_with_index do |char, index|
    (str.size - index - 1).times do |i|
      result << str[index..index + 1 + i]
    end
  end
  result
end

def palindrome?(str)
  str == str.reverse
end

def palindromes(str)
  substrings = substrings(str)
  substrings.select { |substring| palindrome?(substring) }
end

def largest_palindrome(str)
  palindromes = palindromes(str)
  palindromes.max_by { |palindrome| palindrome.size }
end

p largest_palindrome('madam')

