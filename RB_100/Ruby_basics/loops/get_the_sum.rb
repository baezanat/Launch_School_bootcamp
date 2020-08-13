loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
    if answer != 4
      puts "Wrong answer. Try again!"
    else
      puts "That's correct!"
      break
    end
end