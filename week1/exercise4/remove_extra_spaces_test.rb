require 'minitest/autorun'
require_relative 'exercise4'

class PeopleTest < Minitest::Test
  def test_remove_extra_spaces

    test_string = "some_word\n \t...\rseparated  by\nelipsis\r\n.\n"
    puts str = remove_extra_spaces(test_string)
    assert_equal(str, "some_word... separated by elipsis.")

  end
end