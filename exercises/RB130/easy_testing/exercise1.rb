require "minitest/autorun"
require_relative "Num"

class NumTest < Minitest::Test
  def test_that_value_is_odd
    assert(value.odd?), "value is not odd"
  end
end
