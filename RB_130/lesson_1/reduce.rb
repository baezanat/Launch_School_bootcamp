def reduce(array, acc = 0)
  counter = 0
  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end
  acc
end

array = [1, 2, 3, 4, 5]
p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num }

def reduce2(array, default = nil)
  if default != nil
    acc = yield(default, array[0])
  else 
    acc = array[0]
  end
  counter = 1
  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end
  acc
end

p reduce2(['a', 'b', 'c']) { |acc, value| acc += value }
p reduce2([[1, 2], ['a', 'b']]) { |acc, value| acc + value }
