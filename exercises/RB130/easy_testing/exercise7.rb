require "minitest/autorun"
require_relative "Num"

class NumTest < Minitest::Test
  def test_value_is_instance_of_numeric
    assert_instance_of Numeric, value
  end
end
