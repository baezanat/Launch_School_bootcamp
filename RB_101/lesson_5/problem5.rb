require 'pry'
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family

=begin
INPUT: hash with 6 elements, where all the values are inner hashes
OUTPUT: integer

STRATEGY:
1. Make an array with the numbers to be added
  - Use #each_with_object
2. Use the #sum method on the array to get the total
=end

ages = munsters.each_with_object([]) do |(_, value), ages|
  ages << value["age"] if value["gender"] == "male"
end

total = ages.sum
p total
