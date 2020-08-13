=begin
Write a program that given a phrase can count the occurrences of each word in that phrase.

INPUT: string
OUTPUT: hash

algorithm:
- split wherever there is a space or punctuation (other than an apostrophe) --> get an array
- create a new hash. 
- make a copy of the original array, make it unique, and give each key a value of 0.
- iterate over array and increase the value in hash for each key if it's equal to it in the array.
- make sure you return the hash
=end

class Phrase
  attr_accessor :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    arr = phrase.downcase.split(/,|\s/)
    result = Hash.new(0)
    arr.each do |word|
      clean = word.gsub(/\A(')(.+)(')\z/, '\2').gsub(/[^'a-z0-9]/, '')
      result[clean] += 1 if clean != ''
    end
    result
  end

end
