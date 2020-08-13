ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
  "Marilyn" => 22, "Spot" => 237 }

# Pick out the minimum age from our current Munster family hash
def find_lowest_age(ages_hash)
  ages_array = ages_hash.values
  lowest_age = nil
  counter = 1
  loop do
    break if counter == ages_array.size
    if ages_array[counter] < ages_array[counter-1]
    lowest_age = ages_array[counter]
    end
    counter += 1
  end
  lowest_age
end

p find_lowest_age(ages)
