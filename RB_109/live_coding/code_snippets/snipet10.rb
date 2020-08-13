def amethod(param)
  str += 'world'
end

str = 'hello'
amethod(str)

p str

# Will the str variable in line 8 be modified depending on what 
# happens inside amethod?
# This will generate an error because str is initialized in a 
# different scope from the method. Methods create their own scope.

def amethod(param)
  param += 'word'
end

str = 'hello'
amethod(str)

p str

# Here the method invocation will return a new string object,
# and it's not going to have any effect on str.

def amethod(param)
  param << 'word'
end

str = 'hello'
amethod(str)

p str

# Now str is going to be modified

def amethod(param)
  param += 'word'  # This is reassignment
  param + "world"  # This is concatenation (a method, does not mutate the caller)
  param << 'world' # Shovel operator, mutates the caller
end

str = 'hello'
amethod(str)

p str


#What does the following output?
def amethod(param)
  param += 'universe'
  param << 'world'
end

str = 'hello'
amethod(str)

p str
# The output is just hello.
# Line 52 is reassignment, para = param + 'world'
# We are re-assigning param to a new object.
# The destructive method call on line 53 is performed on the 
# new string object.
