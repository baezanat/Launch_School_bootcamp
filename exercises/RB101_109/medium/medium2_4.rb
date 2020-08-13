=begin
Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Examples:

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

Note that balanced pairs must each start with a (, not a ).

INPUT: string
OUTPUT: boolean
RULES:
  - check if the number of left parentheses is the same as right handed parentheses
  - check if first parenthesis is left handed
ALGORITHM:
  - intiate a local variable sum and set it equal to 0
  - Iterate over the string (use String#each_char) and
      add 1 to sum if the current character == '('
      subtract 1 from sum if the current character == ')'
  - If the sum is ever < 0, it means there is a ')' without a corresponding '(' before it
  - So we should break out of the iteration if sum < 0 and return false
  - Otherwise, end the iteration and check if sum == 0.
    If yes, return true. Otherwise, return false.
=end

def balanced?(str)
  sum = 0
  str.each_char do |char|
    if char == '('
      sum += 1
    elsif char == ')'
      sum -= 1
    end
    return false if sum < 0
  end
  sum == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
