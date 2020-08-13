ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843,
  "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Add up all of the ages from the Munster family hash

=begin

INPUT:hash
OUTPUT: integer

STRATEGY
1. Extract the values from the ages hash into an array using Hash#values
2. Iterate over the array using #each to get a sum
  
=end
sum = 0
ages.values.each do |age|
  sum += age
end
p sum
