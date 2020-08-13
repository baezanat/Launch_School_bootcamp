=begin
Build a program that randomly generates and prints Teddy's age.
To get the age, you should generate a random number between 20 and 200.
Example output: Teddy is 69 years old!

INPUT: nothing
OUTPUT: print text to screen
STRATEGY:
1. Create a method with no arguments that
2. Call #rand(range) to generate a random number in 20..200
3. puts concatenated sentence
=end

def age()
  puts ">> Whose age would you like to know?"
  name = gets.chomp
  name << "Teddy" if name == ''
  puts ">> #{name} is #{rand(20..200)} years old!"
end

loop do
  age()
  puts ">> Woud you like to know someone else's age? (enter 'y' to continue)"
  answer = gets.chomp
  break unless answer.downcase == 'y'
end
