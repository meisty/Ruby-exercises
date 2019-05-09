require 'minitest/autorun'
require './squareroot'

class SquareRootTest < Minitest::Test
  attr_reader :sqrt

  def setup
    @sqrt = SquareRoot.new
  end
  # Basic test to ensure that the calculate_square_root method works
  def test_that_square_root_of_9_is_3
    result = sqrt.calculate_square_root(9)
    assert_equal 3, result
  end

  def test_that_square_root_of_16_is_4
    result = sqrt.calculate_square_root(16)
    assert_equal 4, result
  end
  # Need to ensure that if the result is not a whole number we round to the
  # closest whole number.
  def test_that_square_root_of_17_is_4
    result = sqrt.calculate_square_root(17)
    assert_equal 4, result
  end

  def test_that_square_root_of_24_is_5
    result = sqrt.calculate_square_root(24)
    assert_equal 5, result
  end

  def test_that_square_root_of_negative_number_is_nil
    result = sqrt.calculate_square_root(-1)
    assert_nil result
  end

  def test_with_negative_number
    assert_raises(Math::DomainError) { sqrt.calculate_square_root(-3) }
  end

  def test_sqrt_is_class_of_SquareRoot
    assert_instance_of SquareRoot, sqrt
  end

  def test_that_square_root_of_9_is_not_4
    result = sqrt.calculate_square_root(9)
    refute_equal 4, result
  end
end
