# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# Example:
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
#
# INPUT: array of strings
# OUTPUT: array of strings with no vowels
# RESTRICTIONS:
#   - upper and lower case
#   - if string has only vowels, return ''
# ALGORITHM:
#   - Iterate over elements in the array using #map and
#   - use gsub with regex expression to remove vowels (or #delete)

def remove_vowels(arr)
  arr.map do |word|
    word.gsub(/[aeiou]/i,'')
  end
end


remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
