def missing(sorted_array)
  range = (sorted_array[0] + 1...sorted_array[-1])
  new_array = []
  range.each do |num|
    new_array << num
  end
  new_array.select do |num|
    !sorted_array.include? num
  end
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# ===== SIMPLER ======

def missing_2(arr)
  (arr.min..arr.max).to_a - arr
end

p missing_2([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing_2([1, 2, 3, 4]) == []
p missing_2([1, 5]) == [2, 3, 4]
p missing_2([6]) == []
