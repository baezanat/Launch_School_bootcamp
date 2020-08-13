=begin

Write a program that will ask a user for an input of a word or multiple words and
give back the number of characters. Spaces should not be counted as a character.

input: Please write word or multiple words: walk
output: There are 4 characters in "walk".

input: Please write word or multiple words: walk, don't run
output: There are 13 characters in "walk, don't run".

INPUT: string (user input)
OUTPUT: string (sentence) printed to the console
CONSTRAINTS:
- spaces don't count as characters
- what to do with an empty string? --> return 0

STRATEGY:
1. Puts a string asking for word or multiple words.
2. Gets.chomp and save to variable
3. Split string to get rid of spaces. We get an array of words.
4. Use #join to transform the array back to a string and #length
   to get the number of characters. 
5. Puts a sentence with the number of characters in the string.
=end

puts "Please write word or multiple words:"
str = gets.chomp
puts "There are #{str.split.join.length} characters in #{str}."
