=begin
Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.
You may assume that words are any sequence of non-blank characters.
Examples:
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

INPUT: string (sentence)
OUTPUT: String with capitalized words
DATA STRUCTURE: strings and array
ALGORITHM:
  - split string to get an arr W of words
  - iterate over W and use #upcase on W[0]
  - join array with a space between elements
=end

def word_cap(str)
  capitalized_array = str.split
  new = capitalized_array.map do |word|
    word.chars.each_with_index do |char, index|
      if index == 0
        char.upcase!
      else
        char.downcase!
      end
    end
  end
  new.map { |word| word.join }.join(' ')
end

def word_cap_2(str)
  char_arr = str.chars
  capitalized_array = char_arr.each_with_index do |char, index|
    if index == 0
      char.upcase!
    elsif char_arr[index - 1] == ' '
      char.upcase!
    else
      char.downcase!
    end
  end
  capitalized_array.join
end

word_cap_2('four score and seven') == 'Four Score And Seven'
word_cap_2('the javaScript language') == 'The Javascript Language'
word_cap_2('this is a "quoted" word') == 'This Is A "quoted" Word'
