class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  @@total_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@total_vehicles += 1
  end

  def self.number_of_vehicles
    puts "Total number of vehicles: #{@@total_vehicles}"
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park now!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def self.gas_mileage(gallons, miles)
    "Your gas mileage is #{gallons/miles} gallons per mile."
  end

  def age
    puts "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.new.year - self.year
  end
end

module HeavyTransport
  PURPOSE = 'cargo'
  def requires_license
    true
  end
end

class MyCar < Vehicle
  MAIN_LOAD = 'people'
  def to_s
    puts "My car is a #{self.color} #{self.year} #{self.model}."
  end
end

class MyTruck < Vehicle
  include HeavyTransport
  MAIN_LOAD = 'things'
  def to_s
    puts "My truck is a #{self.color} #{self.year} #{self.model}."
  end
end

my_car = MyCar.new(2011, 'silver', 'Toyota Corolla')
my_car.age

# my_car.to_s
# my_truck = MyTruck.new(2001, 'brown', 'Luv')
# my_truck.to_s
# Vehicle.number_of_vehicles
# my_truck.requires_license
# 
# p Vehicle.ancestors
# p MyCar.ancestors
# p MyTruck.ancestors
