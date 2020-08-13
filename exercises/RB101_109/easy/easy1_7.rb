=begin

Write a method that takes one argument, a positive integer, and returns a string of
alternating 1s and 0s, always starting with 1. The length of the string should match
the given integer.
INPUT: positive int
OUTPUT: string of alternating 1s and 0s, starting with 1

REQUIREMENTS:
- what to do with inputs <= 0?

STRATEGY:
1. Create a method that takes an int and
2. initiate an empty return string
3. if int <= 0 return ''
3. if int.even?, (n/2).times push '10' into the return string
4. if int.odd?, ((n-1)/2).times push '10' into the return string, then push '1' into the return string
5. return the return string
=end

def stringy(int)
  output = ''
  if int != 0 && int.even?
    (int/2).times {output << '10'}
  elsif int.odd?
    ((int-1)/2).times {output << '10'}
    output << '1'
  end
  output
end

p stringy(6) #== '101010'
p stringy(9) #== '101010101'
p stringy(4) #== '1010'
p stringy(7) #== '1010101'
p stringy(0) #== ''
