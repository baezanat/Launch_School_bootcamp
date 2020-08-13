=begin
write a method named xor that takes two arguments, and returns true
if exactly one of its arguments is truthy, false otherwise

INPUT: two arguments
OUTPUT: boolean
REQUIREMENTS: 
- returns true if one of the arguments is truthy
- returns false if both are true or both are false
STRATEGY:
1. Create a method that takes in two aruguments
2. Use the || operator but add a condition using && 
   that returns true if both arguments are true
=end

def xor?(arg1, arg2)
  (arg1 || arg2) && !(arg1 && arg2)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
