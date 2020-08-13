=begin
Create a function that returns twice the supplied value unless it is a tricky double.

The trick: if the number passed in is a double, simply return the value that was passed.

Examples of a double number include:

    44
    77
    3333
    8787
    100100

In the example 8787, the number 87 is doubled (appears twice).

tricky_doubles(15)   # should return 30
tricky_doubles(100)  # should return 200
tricky_doubles(4343) # should return 4343

INPUT: int
OUTPUT: int
RULES:
  - if num is a tricky double, return num
  - if num is not a tricky double, return num * 2
ALGORITHM:
  - determine if num is a tricky double
    - Convert num to string
    - If string.size.odd?, return false
    - If string.size.even?, slice string into two equal halves and check if they are equal. 
      If so, return true. Otherwise, return false.
  - if true, return num. Otherwise return num * 2
=end

def tricky_double?(int)
  string = int.to_s
  return false if string.size.odd?
  if string.size.even?
    left = string[0...string.size / 2]
    right = string[string.size / 2...string.size]
    return true if left == right
  end
  false
end

def tricky_doubles(num)
  if tricky_double?(num)
    num
  else
    num * 2
  end
end

p tricky_doubles(13413) # should return 26826
p tricky_doubles(15)   # should return 30
p tricky_doubles(100)  # should return 200
p tricky_doubles(4343) # should return 4343
