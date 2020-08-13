class Banner

  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message

  def length
    message.length
  end

  def horizontal_rule
    '+-' + '-' * message.length + '-+'
  end

  def empty_line
    '| ' + ' ' * message.length + ' |'
  end

  def message_line
    "| #{message} |"
  end
end

msg = Banner.new('Hi!')
puts msg.to_s
