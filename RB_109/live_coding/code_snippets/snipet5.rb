n = 10

1.times do |n|
  n = 11
end

puts n

=begin
- Case of variable shadowing
- Block uses the block parameter and disregard the outer scoped variable
- Variable shadowing prevents us from making changes to the otuer
scoped n
=end
