class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

big_cube = Cube.new(5000)
p big_cube
p big_cube.to_s
