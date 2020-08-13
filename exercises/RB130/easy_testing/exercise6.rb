require "minitest/autorun"
require_relative "Num"

class NumTest < Minitest::Test
  def test_employee_hire_exception
    assert_raises NoExperienceError { employee.hire }
  end
end
