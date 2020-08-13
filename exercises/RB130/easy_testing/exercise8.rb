require "minitest/autorun"
require_relative "Num"

class NumTest < Minitest::Test
  def test_value_subclasses_from_numeric
    assert_kind_of Numeric, value
  end
end
