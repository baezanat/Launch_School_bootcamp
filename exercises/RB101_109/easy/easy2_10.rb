array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin
The code in line 3 pushes every element reference from array 1 into array 2. 
The elements refer TO THE SAME OBJECTS. So, the transformation in line 4 affects
both array1 and array2.

So, the code should print:
#=> [Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo]

=end
