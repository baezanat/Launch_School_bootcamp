=begin
In the modern era under the Gregorian Calendar, leap years occur in every year
that is evenly divisible by 4, unless the year is also divisible by 100.
If the year is evenly divisible by 100, then it is not a leap year unless the year
is evenly divisible by 400. Assume this rule is good for any year greater than year 0.
Write a method that takes any year greater than 0 as input, and returns true if
the year is a leap year, or false if it is not a leap year. Examples:

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

INPUT: integer (year)
RETURN: boolean
  - true for leap year, false otherwise
REQUIREMENTS:
  - y is a leap year if 
    - y % 400 == 0
      OR
    - y % 4 == 0 && y % 100 != 0
  - Applies to any y > 0

DATA STRUCTURE: integer, if statement, boolean
STRATEGY:
  - Create a method that uses an if/elsif/else statement to check if y satisfies the rules
  - Return a boolean
=end

def leap_year?(y)
  y % 400 == 0 || (y % 4 == 0 && y % 100 != 0)
end

=begin
Rewrite leap_year? to test first whether the year is divisible by 4, then, if necessary, whether it is
divisible by 100, and finally, if necessary, test whether it is divisible by 400.
Is this solution simpler or more complex than the original solution?
=end

def leap_year2?(y)
  y % 4 == 0 && (y % 100 != 00 || y % 400 == 0)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
