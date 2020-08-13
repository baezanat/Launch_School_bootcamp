ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts "Spot not included" unless ages.include?('Spot')
puts "Spot is not in here!" if !ages.has_key?('Spot')
puts "Still not here..." if !ages.member?('Spot')
