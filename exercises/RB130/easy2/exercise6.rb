def each_with_index(arr)
  counter = 0
  loop do
    yield(arr[counter], counter)
    counter += 1
    break if counter == arr.size
  end
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
