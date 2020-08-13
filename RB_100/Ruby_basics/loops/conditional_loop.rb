process_the_loop = [true, false].sample

=begin
Using an if/else statement, run a loop that prints 
"The loop was processed!" one time if process_the_loop 
equals true. Print "The loop wasn't processed!" if 
process_the_loop equals false.
=end

if process_the_loop == true
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end
