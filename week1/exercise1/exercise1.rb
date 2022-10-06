def decode_string(str)
  abc = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
  arr = str.split('').reverse
  num = 0
  arr.each.with_index do |e, i|
    num += (26**i) * (abc.index(e) + 1)
  end
  num
end

def generate_secuence(init_str, fin_str)
  secuence = []
  a1 = decode_string(init_str)
  an = decode_string(fin_str)
  i = a1
  while i < an + 1
    secuence.push(init_str)
    init_str = init_str.succ
    i += 1
  end
  puts secuence.join(',')
end

generate_secuence("zw", "aad")
