loop do 
  puts "How many output lines do you want? The minimum is 3!"
  lines = gets.chomp.to_i
  if lines >= 3
    lines.times {puts "Launch School is the best!"}
    break
  else
    puts "The number must be greater than or equal to 3"
  end
end
