require "minitest/autorun"
require_relative "Num"

class NumTest < Minitest::Test
  def test_list_same_object_as_list_process
    assert_same list, list.process
  end
end
