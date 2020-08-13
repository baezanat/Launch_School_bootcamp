=begin
Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.

INPUT: string (English)
OUTPUT: string (pig latin)

Algorithm:
- 
=end
require 'pry'
require 'pry-byebug'

class PigLatin

  def self.translate(str)
    if str.match(/\A([aeiou]|xr|y[^aeiou ])\S+\z/)
      return str + 'ay'
    elsif str.match(/\A[^aeiou ]\S+\z/)
      return str[index_of_first_vowell(str)..-1] +
             str[0...index_of_first_vowell(str)] + 'ay'
    elsif str.match(/\s/)
      translate_phrase(str)
    end
  end

  private

  def self.index_of_first_consonant(word)
    word.chars.each_with_index do |letter, index|
      return index if letter.match(/[^aeiou ]/)
      next
    end
  end

  def self.index_of_first_vowell(word)
    word.chars.each_with_index do |letter, index|
      return index if letter.match(/[aeiou]/) && !(letter == 'u' && word[index - 1] == 'q')
      next
    end
  end

  def self.translate_phrase(phrase)
    phrase.split.map { |word| PigLatin.translate(word) }.join(' ')
  end
end
