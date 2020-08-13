=begin
Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

Examples:

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

INPUT: string
OUTPUT: string (middle character(s))
DATA STRUCTURE: string
ALGORITHM:
  - find middle index or indexes
    - str.size.even?
      - return str[str.size/2 - 1..str.size]
    - str.size.odd?
      - return str.size/2
  - return character at that index(es)
=end

def center_of(str)
  middle = str.size / 2
  if str.size.even?
    str[middle - 1..middle]
  else
    str[middle]
  end
end

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
