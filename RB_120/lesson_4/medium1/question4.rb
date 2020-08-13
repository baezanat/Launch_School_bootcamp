class Greeting
  def greet(string)
    puts string
  end
end

class Goodbye < Greeting
  def bye
    greet('Goodbye')
  end
end

class Hello < Greeting
  def hi
    greet('Hello')
  end
end

p Hello.new.hi
p Goodbye.new.bye

