=begin
Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

Example:
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

ALGORITHM:
- use #chars to create an array of characters in string
- iterate over the array of chars using each_with_index and change each element in the necessary way in a manner that mutates the caller
- use #join
=end

require 'pry'
require 'pry-byebug'
def staggered_case(str)
  char_array = str.chars
  changed_array = char_array.each_with_index do |char, index|
    if index.odd?
      char.downcase!
    elsif index.even?
      char.upcase!
    end
  end
  changed_array.join
end

# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

def staggered_case_interactive(str)
  answer = nil
  loop do
    puts "Enter 'u' for upcase or 'l' for lower case"
    answer = gets.chomp.downcase
    break if answer == 'u' || answer == 'l'
    puts "Invalid answer."
  end
  str_arr = str.chars
  counter = 0
  if answer == 'l'
    str_arr[0].downcase!
    counter += 1
  end
  loop do
    break if counter >= str.size
    str_arr[counter].upcase!
    counter += 1
    break if counter >= str.size
    str_arr[counter].downcase!
    counter += 1
  end
  str_arr.join
end

puts "#{staggered_case_interactive('My name is so and so')}"
