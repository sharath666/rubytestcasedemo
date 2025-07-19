require 'minitest/autorun'
require_relative 'string_calculator'
class StringCalculatorTest < Minitest::Test
  def setup
    @calc = StringCalculator.new
  end

  def test_empty_string_returns_zero
    assert_equal 0, @calc.add("")
  end

  def test_single_number
    assert_equal 1, @calc.add("1")
    assert_equal 5, @calc.add("5")
  end

  def test_two_numbers
    assert_equal 6, @calc.add("1,5")
  end

  def test_multiple_numbers
    assert_equal 10, @calc.add("1,2,3,4")
  end

  def test_newline_as_delimiter
    assert_equal 6, @calc.add("1\n2,3")
  end

    def test_custom_delimiter
    assert_equal 3, @calc.add("//;\n1;2")
    assert_equal 10, @calc.add("//|\n2|3|5")
  end

  def test_negative_number_raises_exception
    error = assert_raises(RuntimeError) { @calc.add("1,-2") }
    assert_equal "negative numbers not allowed: -2", error.message
  end

    def test_multiple_negative_numbers
    error = assert_raises(RuntimeError) { @calc.add("1,-2,-5,3") }
    assert_equal "negative numbers not allowed: -2,-5", error.message
  end
end