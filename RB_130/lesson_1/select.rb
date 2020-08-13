def select(array)
  new = []
  counter = 0
  while counter < array.size
    new << array[counter] unless !!yield(array[counter]) == false
    counter += 1
  end
  puts "new is #{new}"
  new
end

select([1, 2, 3]) do |num|
  num.odd?
end

select([1, 2, 3]) do |num|
  puts num
end

select([1, 2, 3]) do |num|
  num + 1
end
