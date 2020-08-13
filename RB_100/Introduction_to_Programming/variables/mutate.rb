a = [1, 2, 3]
def mutate(array)
	array.pop
end

p "Before mutate method: #{a}"
mutate (a)
p "After mutate method: #{a}"

b = [1, 2, 3]
#Example of a method definition that does not mutate the caller
def no_mutate(array)
	array.last
end

p "Before no_mutate method: #{a}"
no_mutate(b)
p "AFter no_mutate method: #{a}"

puts b.last