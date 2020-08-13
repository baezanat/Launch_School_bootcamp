# There is an array of strings. All strings contains similar letters except one. Try to find it!

# findUniq([ 'Aa', 'aaa', 'aaaaa', 'BbBb', 'Aaaa', 'AaAaAa', 'a' ]) == 'BbBb'
# findUniq([ 'abc', 'acb', 'bac', 'foo', 'bca', 'cab', 'cba' ]) == 'foo'
# Strings may contain spaces. Spaces is not significant, only non-spaces symbols matters. E.g. string that contains only spaces 
# is like empty string.

# It’s guaranteed that array contains more than 3 strings.
=begin

INPUT: array
OUTPUT: string
DATA STRUCTURE: strings and arrays
RULES:
  - input array contains >= 3 elements
  - all elements except for one share the same letters.
  - pick the string that has no letters in common with the others
  - spaces are not significant. 
    Will need to remove spaces for comparison, but will need to return the string with any original spaces it had.
ALGORITHM:
  - Make a copy of the input array.
  - Modify the copy by deleting any spaces present in the strings, downcase all strings.
  - Sort the characters within the strings.
    Convert each string into an array using String#chars. 
    Sort the array.
    Join back into a string.
  - Now the first character in all strings should be exaclty the same except for one.
  - Initialize a local variable `letter` and assign to it the value of the first letter in the first string in the copy array.
  - If this letter is different from the first letter of the second and third strings in the copy array, then the first string in the 
    array is the unique one. In this case, return the first string in the original array.
  - If the ltter is not different from the first character in the second string, then neither of the first two strings is the unique
    one. Use Array#select to find the element whose first character is different from letter.
    This will return a one-element array with the unique string. Use Array#pop to get the string.
  - The index of this string element in the copy (and the input) arrays can be found using the Array#index method.
    Find this index and return the element at that index number in the original input array.
=end

def findUniq(arr)
  copy = arr.dup
  copy2 = (copy.map do |string|
    string.delete(' ').downcase.chars.sort.join
  end)
  letter = copy2[0][0]
  return arr[0] if letter != copy2[1][0] && letter != copy2[2][0]
  unique_array = copy2.select { |string| string[0] != letter }
  unique = unique_array.pop
  idx = copy2.index(unique)
  arr[idx]
end

p findUniq([ 'BbB b', 'aa a', 'aaaaa', ' Aaaa', 'AaAaA a', 'a' ]) == 'BbB b'
p findUniq([ 'abc', 'acb', 'bac', ' foo', 'bca', 'cab', 'cba' ]) == ' foo'
p findUniq([ 'BbBb', 'aaa', 'aaaaa', 'Aaaa', 'AaAaAa', 'a' ]) == 'BbBb'
p findUniq([ ' BbBb', 'aaa', 'aaa aa', 'Aaaa', 'AaAa Aa', 'a' ]) == ' BbBb'
