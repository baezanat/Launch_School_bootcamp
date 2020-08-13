require 'minitest/autorun'
require 'minitest/reporters'
require 'stringio'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(40)
  end

  def test_prompt_for_payment
    assert_equal 0, @transaction.amount_paid
    input = StringIO.new('60\n')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output:output)
    assert_equal 60, @transaction.amount_paid
  end
end

