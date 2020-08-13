n = 10

[1, 2, 3].each do |n|
  puts n
end

=begin
- Case of variable shadowing
- puts n will use the block parameter and disregard the otuer scoped variable
- Variable shadowing prevents us from making changes to the otuer
scoped n
=end
