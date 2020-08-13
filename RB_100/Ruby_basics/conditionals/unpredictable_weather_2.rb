sun = ["visible", "hidden"].sample

def sunny?(sun)
    puts "The clouds are blocking the sun!" unless sun == "visible"
end

sunny?(sun)