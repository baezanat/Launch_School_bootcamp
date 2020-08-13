a = 1

loop do
  b = 2

  loop do
    c = 3
    puts a
    puts b
    puts c
    break
  end

  puts a
  puts b
  puts c
  break
end

puts a
puts b
puts c

=begin
a = first level variable
b = second level variable
c = third level variable

Everything prints in lines 8 - 10

NameError in line 16

Name Errors in lines 21 and 22

Principle: local variable scops and blocks
=end
