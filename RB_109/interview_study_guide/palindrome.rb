=begin
write a method to determine if a word is a palindrome, without using the reverse method

INPUT: string (a word)
OUTPUT: boolean
TEST CASES:
palindrome?('house') == false
palindrome?('madam') == true
palindrome?('pop') == true
palindrome?('') == false

DATA STRUCTURE: strings and arrays
ALGORITHM:
  - build reverse string
    - initiate empty result string
    - iterate over the input string with a manual loop
      - set counter = string.size - 1
      - start loop
        - break counter < 0
        - result << string[counter]
        - counter -= 1
      - end loop
      - return result
  - check if string == reversed string
=end

def reverser(str)
  result = ''
  counter = str.size - 1
  loop do
    break if counter < 0
    result << str[counter]
    counter -= 1
  end
  result
end

def palindrome?(str)
  return false if str.size < 2
  str == reverser(str)
end

p palindrome?('house') == false
p palindrome?('madam') == true
p palindrome?('pop') == true
p palindrome?('') == false
p palindrome?('a') == false
