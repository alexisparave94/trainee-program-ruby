require 'minitest/autorun'
require_relative 'exercise1'

class PeopleTest < Minitest::Test
  def test_generate_correct_series_for_method_generate_series2

    series1 = generate_series2('a', 'e')
    correct_series1 = 'a, b, c, d, e'
    assert_equal(series1, correct_series1)

    series2 = generate_series2('h', 'z')
    correct_series2 = 'h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z'
    assert_equal(series2, correct_series2)

    series3 = generate_series2('t', 'bd')
    correct_series3 = 't, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, ao, ap, aq, ar, as, at, au, av, aw, ax, ay, az, ba, bb, bc, bd'
    assert_equal(series3, correct_series3)

    series4 = generate_series2('zt', 'abh')
    correct_series4 = 'zt, zu, zv, zw, zx, zy, zz, aaa, aab, aac, aad, aae, aaf, aag, aah, aai, aaj, aak, aal, aam, aan, aao, aap, aaq, aar, aas, aat, aau, aav, aaw, aax, aay, aaz, aba, abb, abc, abd, abe, abf, abg, abh'
    assert_equal(series4, correct_series4)

  end

  def test_generate_correct_series_for_method_generate_series3

    series1 = generate_series3('a', 'e')
    correct_series1 = 'a, b, c, d, e'
    assert_equal(series1, correct_series1)

    series2 = generate_series3('h', 'z')
    correct_series2 = 'h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z'
    assert_equal(series2, correct_series2)

    series3 = generate_series3('t', 'bd')
    correct_series3 = 't, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, ao, ap, aq, ar, as, at, au, av, aw, ax, ay, az, ba, bb, bc, bd'
    assert_equal(series3, correct_series3)

    series4 = generate_series3('zt', 'abh')
    correct_series4 = 'zt, zu, zv, zw, zx, zy, zz, aaa, aab, aac, aad, aae, aaf, aag, aah, aai, aaj, aak, aal, aam, aan, aao, aap, aaq, aar, aas, aat, aau, aav, aaw, aax, aay, aaz, aba, abb, abc, abd, abe, abf, abg, abh'
    assert_equal(series4, correct_series4)

  end
end
