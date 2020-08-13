=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

Examples

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

INPUT: string
OUTPUT: hash
ALGORITHM:
  - initialize an empty hash H with the keys we need
  - iterate over the chars of the string and use regex to search for a match and
    increase the value in H accordingly
=end

def letter_case_count(string)
  result = {lowercase: 0, uppercase: 0, neither:0 }
  string.chars.each do |char|
    if char.match(/[a-z]/)
      result[:lowercase] += 1
    elsif char.match(/[A-Z]/)
      result[:uppercase] += 1
    elsif char.match(/[^a-z]/i)
      result[:neither] += 1
    end
  end
  result
end

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
