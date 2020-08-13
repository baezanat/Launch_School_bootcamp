
def answer(int)
  case
  when (0 <= int) && (int <= 50)
	puts "The number is between 0 and 50."
  when (51 <= int) && (int <= 100)
	puts "The number is between 50 and 100."
  when int > 100
	puts "The number is greater than 100."
  else
	puts "The number is not valid."
  end
end

puts "Please enter a number between 0 and 100:"
num =  gets.chomp.to_i
answer(num)