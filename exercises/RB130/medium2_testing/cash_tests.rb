require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(40)
    @transaction.amount_paid = 60
  end

  def test_accept_money
    @register.accept_money(@transaction)
    assert_equal 160, @register.total_money
  end

  def test_change
    assert_equal 20, @register.change(@transaction)
  end

  def test_give_receipt
    assert_output("You've paid $40.\n") do
      @register.give_receipt(@transaction)
    end
  end

  def test_prompt_for_payment
    @transaction.prompt_for_payment(60)
    assert_output("You owe $40.\nHow much are you paying?")
  end
end

