str = IO.read('strings.txt')
str = str[16..]

str = str.gsub(/[^\.\n]\n/) { |m| "#{m[0]} " }
         .gsub(/\.\n[^\n]/) { |m| "#{m[0]} #{m[2]}" }
         .gsub(/ +/, ' ')
         .gsub(/ +[\.,]/) { |m| m[1] }
         .gsub(/\.\./) { |m| "#{m[0]} " }

File.open('without_extra_spaces.txt', 'w') do |file|
  file.write(str)
end

puts quant_start_with_dis = str.scan(/^dis| dis/i).size
puts quant_end_with_ing = str.scan(/ing[ .,]/i).size
