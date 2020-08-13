=begin
Build a program that asks a user for the length and width of a room in meters
and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run:
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

INPUT: float (length) and float (width)
OUTPUT: Sentences printed to the console
STRATEGY:
1. Puts a sentence asking user for length of room in meters
2. Use length = gets.chomp to get the answer
3. Puts a sentence asking user for width of room in meters
4. Use width = gets.chomp to get the answer
5. area_sqr_mtrs = length * width
6. area_sqr_ft = area_sqr_mtrs * 10.7639
7. Puts statement with total area and round floats to two decimals using Float.round(2)
=end

puts ">> Enter the length of the room in meters:"
length = gets.chomp.to_f
puts">> Enter the width of the room in meters:"
width = gets.chomp.to_f

area_sqr_mtrs = length * width
area_sqr_ft = area_sqr_mtrs * 10.7639

puts">> The area of the room is #{area_sqr_mtrs.round(2)} (#{area_sqr_ft.round(2)} square feet)."
