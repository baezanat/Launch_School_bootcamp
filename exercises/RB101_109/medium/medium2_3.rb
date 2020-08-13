=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples

letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

INPUT: string
OUTPUT: hash
RULES:
  - count number of characters (including spaces) and return percentages for
    - uppercase letters
    - lowercase letters
    - non-letters
  - string will never be empty
DATA STRUCTURES: arrays and strings
ALGORITHM:

1. Count number of uppercase letters:
   uppercase = str.chars.select { |char| char.match(/[A-Z]/) }.count
   Get percentage of uppercase letters:
   upper_percentage = (uppercase / str.size) * 100

2. Count number of lowercase letters
   lowercase = str.chars.select { |char| char.match(/[a-z]/) }.count
   lower_percentage = (lowercase / str.size) * 100

3. Count number of non-letters
   non_letters = str.chars.select { |char| char.match(/[^a-z]/i) }.count
   non_letter_percentage = (non_letters / str.size) * 100

4. Inialize a result hash and add key-value pairs with percentages.
=end

def letter_percentages(str)
   uppercase = str.chars.select { |char| char.match(/[A-Z]/) }.count
   upper_percentage = (uppercase / str.size.to_f) * 100
   
   lowercase = str.chars.select { |char| char.match(/[a-z]/) }.count
   lower_percentage = (lowercase / str.size.to_f) * 100
   
   non_letters = str.chars.select { |char| char.match(/[^a-z]/i) }.count
   non_letter_percentage = (non_letters / str.size.to_f) * 100

   result = Hash.new
   result[:lowercase] = lower_percentage
   result[:uppercase] = upper_percentage
   result[:neither] = non_letter_percentage
   result
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
