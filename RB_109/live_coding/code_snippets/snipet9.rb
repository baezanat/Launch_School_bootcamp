a = 'hello'

[1, 2, 3].map { |num| a }

=begin
- output: ['hello', 'hello', 'hello']

- the method map does not have direct access to a but is able to use the value of a to perform transformation on the array because the block is able to access a and return it to map.
=end
