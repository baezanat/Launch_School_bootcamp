number_of_lines = nil
loop do
  puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit):'
  input = gets.chomp
  break if input.downcase == "q"
  number_of_lines = input.to_i
  if number_of_lines < 3
    puts ">> That's not enough lines."
    next
  else 
    number_of_lines.times {puts '>>Launch School is the best!'}
  end
end