sun = ["visible", "hidden"].sample

def sunny?(sun)
  if sun == "visible"
    puts "The sun is so bright!"
  end
end

sunny?(sun)