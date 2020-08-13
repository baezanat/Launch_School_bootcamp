def zip(arr1, arr2)
  new = []
  counter = 0
  loop do
    break if counter == arr1.size
    new << [arr1[counter], arr2[counter]]
    counter += 1
  end
  new
end

p zip([1, 2, 3], [4, 5, 6])
