a = 'hi'

def some_method
  puts a
end

# a method def can't access local variables in another scope

def some_method(a)
  puts a
end

some_method(5)

# a method def can access objects passed in as arguments
# The integer 5 is passed into some_method as an argument, 
#   assigned to the method parameter 'a' and thus made available
#    to the method body as a local variable. That's why we can call
#    puts a from within the method definition.
