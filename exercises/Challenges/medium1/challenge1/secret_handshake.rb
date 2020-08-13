=begin
1 = wink
10 = double blink
100 = close your eyes
1000 = jump
10000 = Reverse the order of the operations in the secret handshake.

handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]

Strategy:
- Change integer to binary string using #to_s(2)
- Reverse string
- initiate a new array of binary multiples
- Iterate over the string (#chars -> array) keeping trakc of index (#each_with_index?)
  - if current item == 1, add (10 ** index) to array of binary multiples
  - map each number in the array of bin mult to a string with the secret handshake actions. We can do this using a hash that stores the instructions for conversion.
  - If the array of actions ends with 'Reverse', reverse the string.
  - Make a test to check for validity and return [] if the argument passed to initialize method is not a valid integer.
  - Make sure that the input can be either an integer (decimal) OR A STRING (binary).
=end

class SecretHandshake

  def commands
    return [] if binary == 0
    multiples = []
    binary.reverse.chars.each_with_index do |num, idx|
      multiples << (10 ** idx) if num == '1'
    end
    actions = multiples.map { |num| COMMANDS[num] }
    return actions unless actions [-1] == 'reverse'
    actions.reverse[1..-1]
  end

  private

  COMMANDS = { 1 => 'wink',
               10 => 'double blink',
               100 => 'close your eyes',
               1000 => 'jump',
               10000 => 'reverse'}

  attr_reader :num

  def initialize(num)
    @num = num
  end

  def binary
    binary = 0
    if num.is_a?(Integer)
      binary = num.to_s(2)
    elsif num.match(/\d+/)
      binary = num
    end
    binary
  end


end

