require 'minitest/autorun'
require_relative 'exercise2'

class PeopleTest < Minitest::Test
  def test_generate_correct_histogram_for_simple_sort_array

    arr = [1, 2, 3]
    histogram = arr.to_histogram
    assert_equal(histogram[1], 1)
    assert_equal(histogram[2], 1)
    assert_equal(histogram[3], 1)

  end

  def test_generate_correct_histogram_for_simple_unsort_array

    arr = [5, 1, 2, 3, 4]
    histogram = arr.to_histogram
    assert_equal(histogram[1], 1)
    assert_equal(histogram[2], 1)
    assert_equal(histogram[3], 1)
    assert_equal(histogram[4], 1)
    assert_equal(histogram[5], 1)

  end

  def test_generate_correct_histogram_for_complex_array

    arr = [5, 5, 0, 0, 0, true, true, -1, 'hello', false]
    histogram = arr.to_histogram
    assert_equal(histogram[true], 2)
    assert_equal(histogram[5], 2)
    assert_equal(histogram[0], 3)
    assert_equal(histogram[-1], 1)
    assert_equal(histogram['hello'], 1)
    assert_equal(histogram[false], 1)

  end
end