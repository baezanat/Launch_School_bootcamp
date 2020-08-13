def greetings
  yield
  puts 'Goodbye'
end

word = 'Hello'

greetings do
  puts word
end

=begin
- outputs 'Hello'
- outputs 'Goodbye'

-The yield keyword controls the interaction with the block. It executes the block once.
The block has access to the local variable word, so 'Hello' is output when the block is executed.

- Blocks and methods can interact with each other; the level of that interaction is set by the method definition and then used at method invocation.
=end
