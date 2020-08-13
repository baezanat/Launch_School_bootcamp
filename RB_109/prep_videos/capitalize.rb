=begin
Write a method that takes a single String argument and returns a new string that contains the original value of the argument, but the first letter of every word is now capitalized.
You may assume that words are any sequence of non-blank characters, and that only the first character of each word must be considered.
Examples:

word_cap("four score and seven') == 'Four Score And Seven'
word_cap("the javaScript language") == "The JavaScript Language"
word_cap("this is a 'quoted' word") == "This Is A 'quoted' Word"

INPUT: string
OUTPUT: (modified) string
RULES: 
  - same string object or new object?
  - capitalize each word
  - keep capitals within words
  - If first character of word is not a letter, second character does not get capitalized
  - words are sequences of non-blank characters (everything but a space)
DATA STRUCTURE: strings and arrays
ALGORITHM:
 - Convert string to array using String#split
 - Iterate over the array using Array#each and set word[0] = word[0].capitalize (again, use bang if need to return the same object)
=end

def word_cap(str)
  new = str.split.each { |word| word[0] = word[0].capitalize }
  new.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap("the javaScript language")  == "The JavaScript Language"
p word_cap("this is a 'quoted' word") == "This Is A 'quoted' Word"
