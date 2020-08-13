a = 'hi there'
b = a
a = 'not here'

=begin
In line 1, variable a is initialized, pointing to the string object.
In line 2, variable b is initialized, point to the same object.
In line 3, variable a is reassigned to point to another string object.
In the end, we have two variables pointing to two different objects.
=end

a = 'hello'
b = a
b << 'world'

puts a
puts b
# The output of both lines is 'hello world'
# The shovel operator is a destructive call; it goes into the 
# object and modifies the value of the object.
