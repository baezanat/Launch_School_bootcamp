=begin
Write a method that returns true if the string passed as an argument is a palindrome, false otherwise.
The method should be case-insensitive, and it should ignore all non-alphanumeric characters. Ex:
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

INPUT: string
OUTPUT: boolean

REQUIREMENTS:
- ignore spaces and all non-alphanumeric characters
- case insensitive

DATA STRUCTURE:
- string

ALGORITHM:
- Use #gsub(/[^0-9a-zA-Z]/, '') to get rid of non alphanumerics and downcase!
- Check if string == reversed string
=end

def real_palindrome?(str)
  str.downcase!
  str.gsub!(/[^0-9a-zA-Z]/, '')
  str == str.reverse ? true : false
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
