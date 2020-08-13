loop do
  puts "Do you want me to print 'something'? (y/n)"
  answer = gets.chomp
  case answer
    when "y", "Y", "yes", "Yes"
      puts "something"
      break
    when "n", "N", "no", "No"
      break
    else 
      puts "Invalid answer! Type 'y' or 'n'."
  end
end