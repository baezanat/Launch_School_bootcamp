class Minilang
  attr_accessor :register, :stack, :commands

  def initialize(string)
    @register = 0
    @stack = Array.new
    @commands = string.split
  end

  def eval
    begin
    commands.each do |cmd|
      if cmd.to_i.to_s == cmd
        self.register = cmd.to_i
      else send(cmd.downcase.to_sym)
      end
    end
    rescue NoMethodError => e
      puts e.message
    end
  end

  def push
    stack << register
  end

  def add
    self.register = register + stack.pop
  end

  def sub
    self.register = register - stack.pop
  end

  def mult
    self.register = register * stack.pop
  end

  def div
    self.register = register / stack.pop
  end

  def mod
    self.register = register % stack.pop
  end

  def pop
    self.register = stack.pop
  end

  def print
    puts "Empty stack!" if register == nil
    puts register
  end
end

# Minilang.new('PRINT').eval
# Minilang.new('5 PUSH 3 MULT PRINT').eval
# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# Minilang.new('5 PUSH POP POP PRINT').eval
# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB
# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# Minilang.new('6 PUSH').eval
