=begin
Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number,
and then computes the sum of those multiples. For instance, if the supplied number is 20, the result
should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
You may assume that the number passed in is an integer greater than 1.
Examples:
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

INPUT: num > 1
OUTPUT: integer, sum of selected multiples
DATA STRUCTURE: array
STRATEGY
  - get multiples of 3 in (1..num) and push into an array called multiples
  - get multiples of 5 in (1..num) and push into multiples
  - return sum of numbers in the array
=end

def multisum(num)
  multiples = (1..num).select { |mult| mult % 3 == 0 || mult % 5 == 0}
  multiples.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
