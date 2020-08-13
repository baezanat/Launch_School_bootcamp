arr = [1, 3, 5, 7, 9, 11]
num = 3
def check(array, number)
  if array.include?(number)
    puts "#{number} is included in the array."
  else
    puts "#{number} is not in the array."
  end
end

check(arr, num)