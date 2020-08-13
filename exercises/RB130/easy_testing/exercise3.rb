require "minitest/autorun"
require_relative "Num"

class NumTest < Minitest::Test
  def test_value_is_nil
    assert_nil value
  end
end
