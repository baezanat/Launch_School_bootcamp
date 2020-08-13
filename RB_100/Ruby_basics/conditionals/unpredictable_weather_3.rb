sun = ["visible", "hidden"].sample

def sunny?(sun)
  if sun == "visible"
    puts "The sun is so bright!"
  else
    puts "The clouds are blocking the sun!"
  end
end

sunny?(sun)