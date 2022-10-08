require 'minitest/autorun'
require_relative 'exercise3'

class PeopleTest < Minitest::Test
  def test_calculate_mean_median_mode_for_empty_array

    arr = []
    assert_equal(mean(arr), 0)
    assert_equal(median(arr), 0)
    assert_equal(mode(arr), 0)

  end

  def test_calculate_mean_median_mode_for_sorted_arrays

    arr1 = [1, 2, 3, 4, 5]
    arr2 = [1, 2, 3, 4, 5, 6]

    assert_equal(mean(arr1), 3)
    assert_equal(median(arr1), 3)
    assert_equal(mode(arr1), [1, 2, 3, 4, 5])

    assert_equal(mean(arr2), 3.5)
    assert_equal(median(arr2), 3.5)
    assert_equal(mode(arr2), [1, 2, 3, 4, 5, 6])

  end

  def test_calculate_mean_median_mode_for_complex_arrays

    arr1 = [5, 3, 3, -1, 3, 2]
    arr2 = [2, 4, 4, 3, -2, 7, 3]

    assert_equal(mean(arr1), 2.5)
    assert_equal(median(arr1), 3)
    assert_equal(mode(arr1), 3)

    assert_equal(mean(arr2), 3)
    assert_equal(median(arr2), 3)
    assert_equal(mode(arr2), [3, 4])

  end
end