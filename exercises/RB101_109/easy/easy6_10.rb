=begin
Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

Examples:

triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

INPUT: int
OUTPUT: printed image (side-effect)
DATA STRUCTURE: array
ALGORITHM:
  - First line: print (n-1) empty spaces and 1 star
  - reduce one empty space while adding 1 star in each line
  - until you print 0 empty spaces and n lines
=end

def triangle(num)
  empty_spaces = (0..num-1).to_a.reverse!
  stars = (1..num).to_a
  spaces_and_stars = empty_spaces.zip(stars)
  spaces_and_stars.each do |arr|
    puts " " * arr[0] + "*" * arr[1]
  end
end

triangle(10)
