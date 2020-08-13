require "minitest/autorun"
require_relative "Num"

class NumTest < Minitest::Test
  def test_list_is_empty
    assert_empty list
  end
end
