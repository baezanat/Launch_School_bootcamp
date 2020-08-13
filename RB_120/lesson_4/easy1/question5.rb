class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

apple = Fruit.new('apple')
yummy = Pizza.new('margarita')
p apple.instance_variables
p yummy.instance_variables
