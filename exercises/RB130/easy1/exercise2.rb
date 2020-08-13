def compute
  return "Does not compute" unless block_given?
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute  == 'Does not compute'

def compute2(arg)
  return "Does not compute" unless block_given?
  yield(arg)
end

p compute2(5) { |num| num + 3 } == 8
p compute2('c') { 'a' + 'b' } == 'ab'
p compute2(2)  == 'Does not compute'
