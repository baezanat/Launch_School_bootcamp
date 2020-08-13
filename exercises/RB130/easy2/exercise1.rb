def step(first, last, step)
  current = first
  arr = [first]
  loop do
    current += step
    arr << current
    break if current == last
  end
  arr.each { |item| yield(item) }
  arr
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
