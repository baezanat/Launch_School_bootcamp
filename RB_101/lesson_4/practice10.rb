=begin
Modify the hash such that each member of the Munster family has an additional 
"age_group" key that has one of three values describing the age group the family 
member is in (kid, adult, or senior)
a kid is in the age range 0 - 17, an adult is in the range 18 - 64 
and a senior is aged 65+.

INPUT: Hash
OUTPUT: Hash with one extra key-value pair

1. Create an array with keys; call it names
2. Create an array with the hash values (which are in turn hashes), call it info
3. Iterate over the info array. In each element:
  - If [0..17].include?(element["age"]), add (age group => kid) to element
  - If [18..64].include?(element["age"]), add (age group => adult) to element
  If element["age"] > 65, add (age group => senior) to element
4. Use names.zip(info) to merg the two arrays into nested arrays
5. Use .to_h to get one overall hash again.

=end
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts "The object id before transformation is #{munsters.object_id}."

munsters.each do |name, info|
  if [0..17].include?(info["age"])
    info["age_group"] = "kid"
  elsif [18..64].include?(info["age"])
    info["age_group"] = "adult"
  else info["age_group"] = "senior"
  end
end

puts "The object id after transformation is #{munsters.object_id}."

p munsters
