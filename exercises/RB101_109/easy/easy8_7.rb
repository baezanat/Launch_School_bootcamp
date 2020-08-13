=begin
Write a method that takes a string, and returns a new string in which every character is doubled.
Examples:
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

ALGORITHM:
  - Use #chars to turn string into array
  - Make a copy of the array
  - Zip the two arrays
  - Join
=end

def repeater(str)
  arr1 = str.chars
  arr1.zip(arr1).join
end

repeater('Hello') == "HHeelllloo" # => true
repeater("Good job!") == "GGoooodd  jjoobb!!" # => true
repeater('') == '' # => true
