arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# For each of these collection objects where the value 3 occurs,
# demonstrate how you would change this to 4.

# For arr1
new_array = arr1.map do |element1|
  if element1.to_s.size == 1 
    element1 += 1 if element1 == 3
    element1 if element1 != 3
  elsif element1.is_a?(Array) 
    element1.map do |arr_element|
      arr_element += 1 if arr_element == 3
      arr_element if arr_element != 3
    end
  end
end

p new_array

# For arr2
arr2[2] = 4 
p arr2

# For hsh1
hsh1[:first][2][0] = 4
p hsh1

# For hsh2
hsh2[['a']][:a][2] = 4
p hsh2
