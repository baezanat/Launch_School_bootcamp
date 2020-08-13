class KrispyKreme
  attr_reader :filling_type, :glazing  # => nil

  def initialize(filling_type, glazing)
    @filling_type = filling_type         # => nil, "Vanilla", nil,     nil,                   "Custard"
    @glazing = glazing                   # => nil, nil,       "sugar", "chocolate sprinkles", "icing"
  end                                    # => :initialize

  def to_s
    if filling_type && glazing           # => nil, nil, nil, nil, "icing"
      "#{filling_type} with #{glazing}"  # => "Custard with icing"
    elsif filling_type                   # => nil, "Vanilla", nil, nil
      "#{filling_type}"                  # => "Vanilla"
    elsif glazing                        # => nil, "sugar", "chocolate sprinkles"
      "Plain with #{glazing}"            # => "Plain with sugar", "Plain with chocolate sprinkles"
    else
      'Plain'                            # => "Plain"
    end                                  # => "Plain", "Vanilla", "Plain with sugar", "Plain with chocolate sprinkles", "Custard with icing"
  end                                    # => :to_s
end                                      # => :to_s


donut1 = KrispyKreme.new(nil, nil)                    # => #<KrispyKreme:0x000055d0ef190bc0 @filling_type=nil, @glazing=nil>
donut2 = KrispyKreme.new("Vanilla", nil)              # => #<KrispyKreme:0x000055d0ef1905d0 @filling_type="Vanilla", @glazing=nil>
donut3 = KrispyKreme.new(nil, "sugar")                # => #<KrispyKreme:0x000055d0ef191b88 @filling_type=nil, @glazing="sugar">
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")  # => #<KrispyKreme:0x000055d0ef197a38 @filling_type=nil, @glazing="chocolate sprinkles">
donut5 = KrispyKreme.new("Custard", "icing")          # => #<KrispyKreme:0x000055d0ef197420 @filling_type="Custard", @glazing="icing">

puts donut1  # => nil
puts donut2  # => nil
puts donut3  # => nil
puts donut4  # => nil
puts donut5  # => nil

# >> Plain
# >> Vanilla
# >> Plain with sugar
# >> Plain with chocolate sprinkles
# >> Custard with icing
