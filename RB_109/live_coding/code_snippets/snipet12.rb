def prefix(str)
  'Dr.' + str
end

name = 'Mary'
prefix(name)

puts name

# Questions: what will this print?
# How to fix it so it prints 'Mr. Joe'
# answer: either reassign name = prefix(name) in line 6 or change the + in the method to a <<.
