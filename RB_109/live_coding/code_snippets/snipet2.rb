2.times do
  a = 'hi'
  puts a
end

loop do
  puts a
  break
end

puts a

=begin
- Error in lines 7 and 11 because the initial assignment in l
line 2 is scoped within the block that follows the times method 
invocation
- Fundamental concept: Peer blocks cannot reference varialbes 
initialized in other blocks.

=end
