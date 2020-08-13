name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# The #upcase! method mutates the caller, so it mutates the object that both 
# save_name and name point to. The above code should thus print out
# => BOB
#    BOB
