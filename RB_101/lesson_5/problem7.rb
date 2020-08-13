a = 2
b = [5, 8]
arr = [a, b]
puts "a is #{a}, b is #{b} and arr is [a,b] or #{arr}."

arr[0] += 2
puts "After adding 2 to arr[0], arr is #{arr} but a is still #{a}. A was not changed
because only the array was changed (arr[0] now points to a different object)."
arr[1][0] -= a
puts "After subtracting a from the first element in the second element of arr,
arr is #{arr} and b is #{b}. B was changed because the array was changed,
and b points to the array itself, not the element object."
