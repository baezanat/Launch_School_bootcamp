ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# Remove people with age 100 and greater.

young = ages.reject { |key, value| value >= 100 }
p young
