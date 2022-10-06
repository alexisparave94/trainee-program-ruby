# Method to decode str in its correspondent position of the series: "a,b,c,d,..., z,aa,ab,ac,...,zy,zz,aaa,aab,..."
def decode_string(str)
  # Generate the alphabet: abc = [a, b, c, ..., z]
  abc = (97..122).map(&:chr)
  arr = str.split('').reverse
  num = 0
  # This loop transform the letter to its correspondent position in the series
  arr.each.with_index do |e, i|
    num += (26**i) * (abc.index(e) + 1)
  end
  num
end

# Method to generate the series
def generate_series(init_str, fin_str)
  series = []
  # Position where the series starts
  a1 = decode_string(init_str)
  # Position where the series finishes
  an = decode_string(fin_str)
  i = a1
  # Loop to traverse all terms from a1 to an positions
  while i < an + 1
    series.push(init_str)
    init_str = init_str.succ
    i += 1
  end
  puts series.join(',')
end

generate_series("xe", "aad")
