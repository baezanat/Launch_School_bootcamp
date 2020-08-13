=begin
Write a method that will take a short line of text and print it w/n a box.
Example:
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

INPUT: str
OUTPUT: str
DATA STRUTURE: str
ALGORITHM:
  - determine length l of input string
  - puts +, l+2 times (-), +
  - puts |, l+2 times (' '), |
  - puts |, ' ', str, ' ', |
  - repeat step 2 above
  - repeat step 1 above
=end

def print_in_box(str)
  first_line = "+#{'-' * (str.length + 2)}+"
  second_line = "|#{' ' * (str.length + 2)}|"
  third_line = "| #{str} |"
  puts "#{first_line}\n#{second_line}\n#{third_line}\n#{second_line}\n#{first_line}"
end

p print_in_box('aaa')
p print_in_box('To boldly go where no one has gone before.')
p print_in_box(' ')

