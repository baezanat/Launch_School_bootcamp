munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# print out the name, age and gender of each family member like this:
# (Name) is a (age)-year-old (male or female).
=begin
INPUT: Hash with five key/value pairs where the values are inner hashes
OUTPUT: String
STRATEGY:
1. Iterate over the munsters hash using #each
2. print out string with selected items from each iteration
=end

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]}-year old #{details["gender"]}."
end
