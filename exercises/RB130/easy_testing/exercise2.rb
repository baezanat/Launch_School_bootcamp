require "minitest/autorun"
require_relative "Num"

class NumTest < Minitest::Test
  def test_downcase
    assert_equal('xyz', value.downcase)
  end
end
