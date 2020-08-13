=begin
Write a method that takes a string and returns a boolean indicated whether the string has a balanced set of parentheses.
balancer('hi') == true
balancer("(hi") == false
balancer("(hi)") == true

Bonus:
balancer(")hi(") == false

INPUT: string
OUTPUT: boolean
RULES:
  - number of '(' and ')' equal
  - there must not be any ')' that does not correspond to a previous '('
    (the number of '(' must always be equal or greater than the number of ')' as we iterate through)
ALGORITHM:
  - accum = 0
  - iterate through the string and
    - if current character is '(', accum += 1
    - if current character is ')', accum -= 1
    - if accum < 0, return false (not balanced)
  - if we didn't return within the loop, check for accum value.
    - if accum == 0, return true
    - otherwise, return false
=end

def balancer(str)
  accum = 0
  str.each_char do |char|
    if char == '('
      accum += 1
    elsif char == ')'
      accum -= 1
    end
    return false if accum < 0
  end
  accum == 0
end

 p balancer('hi') #== true
 p balancer("(hi") #== false
 p balancer("(hi)") #== true
 p balancer(")hi(") #== false
