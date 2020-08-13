words = "the flintstones rock"
# create a method to get a string with each word capitalized, 
# as it would be on a title

=begin
INPUT: string
OUTPUT: string

STRATEGY
1. Use #split to get an array with the different words in the input string
   and save to a variable
2. Iterate over the array and capitalize! each element
3. Convert the array to a string with join and make sure to add a space b/n words
=end

=begin
word_array = words.split
word_array.each { |word| word.capitalize!}
title = word_array.join(' ')
p title
=end

def titleize(string)
  arr = string.split.each { |word| word.capitalize!}
  title = arr.join(' ')
  title
end

p titleize(words)
