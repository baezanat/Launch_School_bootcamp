require "minitest/autorun"
require_relative "Num"

class NumTest < Minitest::Test
  def test_xyz_is_not_in_list
    refute_includes list, 'xyz'
  end
end
