def contains_lab?(string)
  if string =~ /lab/
   puts string
  end
end

contains_lab?("laboratory")
contains_lab?("experiment")
contains_lab?("Pans Labyrinth")
contains_lab?("elaborate")
contains_lab?("polar bear") 