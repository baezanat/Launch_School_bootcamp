class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Cat
  def speak
    'meow!'
  end
end

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak
puts teddy.swim
ralph = Bulldog.new
puts ralph.speak
puts ralph.swim
