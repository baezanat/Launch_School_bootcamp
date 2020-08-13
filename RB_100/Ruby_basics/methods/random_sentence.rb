names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(array)
  array[rand(array.size)]
end

def activity(array)
  array[rand(array.size)]
end

def sentence(a, b)
  "#{a} loves #{b}!"
end

puts sentence(name(names), activity(activities))