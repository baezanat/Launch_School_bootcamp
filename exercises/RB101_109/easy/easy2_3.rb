=begin
Create a simple tip calculator. The program should prompt for a bill amount and a tip rate.
The program must compute the tip and then display both the tip and the total amount of the bill.
example:
What is the bill? 200
What is the tip percentage? 15
The tip is $30.0
The total is $230.0

STRATEGY:
1. puts statement asking for bill amount; get answer (save to variable) and change to float
2. puts statement asking for tip percentage; get answer (save to variable), 
   divide by 100 and change to float
3. calculate tip by multiplying the two values
4. calculate total by adding tip bo bill amount
5. puts sentences with result (round float amounts to 2 decimal places)

puts ">> What is the bill?"
bill = gets.to_f
puts ">> What is the tip percentage?"
tip_percent = gets.to_f
tip = (bill * tip_percent / 100).round(2)
puts ">> The tip is $#{"%.2f" % tip}"
total = (bill + tip).round(2)
puts ">> The total is $#{"%.2f" % total}"
=end

puts ">> What is the bill?"
bill = gets.to_f
puts ">> What is the tip percentage?"
tip_percent = gets.to_f
tip = (bill * tip_percent / 100).round(2)
puts ">> The tip is %.2f" % [tip]
total = (bill + tip).round(2)
puts ">> The total is #{format('%.2f', total)}"
