# Let's write a method called select_letter, that takes a string and 
# returns a new string containing only the letter that we specified. 
# We want it to behave like this:
# select_letter(question, 'a') # => "aaaaaaaa"
# select_letter(question, 't') # => "ttttt"
# select_letter(question, 'z') # => ""

=begin
PROBLEM AND EXAMPLES
input: string and letter
output: string
explicit requirements:
- return string with specified letter
- return letter as many times as it appears in string
- if letter is not in string, return an empty string
implicit: should we return the same object or a new one?

DATA STRUCTURE AND ALGORITHM
- use strings

Algorithm:
- create a result string
- iterate over given string and push every instance of letter into return string.
- return return string.
=end

def select_letter(string, letter)
  letter_string = ''
  counter = 0
  loop do
    break if counter == string.size
    current_letter = string[counter]
    letter_string << current_letter if current_letter == letter
    counter += 1
  end
  letter_string
end

question = 'How many times does a particular character appear in this sentence?'
puts select_letter(question, 'a') # => "aaaaaaaa"
puts select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""
