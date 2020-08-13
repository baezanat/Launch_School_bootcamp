=begin
Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

Examples:

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
=end

def double_consonants(str)
  result = []
  str.chars.map do |char|
    if char.match(/[a-z&&[^aeiou]]/i)
      result << char << char
    else
      result << char
    end
  end
  result.join
end

double_consonants('String') == "SSttrrinngg" # => true
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!" # => true
double_consonants("July 4th") == "JJullyy 4tthh" # => true
double_consonants('') == "" # => true
