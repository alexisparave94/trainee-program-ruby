# Read and save all the content of the file strings.txt in the variable str
str = IO.read('strings.txt')
# Cut the string because I only need from the first paragraph
str = str[16..]

# This method remove all extra spaces and correct some specific cases
def remove_extra_spaces(str)
  str.gsub(/\.[\s]+\z/) { |m| m[0] }
     .gsub(/^[\t\r ]+\S/) { |m| m[-1] }
     .gsub(/[^\.\n]\n/) { |m| "#{m[0]} " }
     .gsub(/\.\n[^\n]/) { |m| "#{m[0]} #{m[2]}" }
     .gsub(/[\t\r ]+/, ' ')
     .gsub(/ +[\.,]/) { |m| m[1] }
     .gsub(/(\w)(\.)(\.)([\w ])/, '\1\3 \4')
end

str = remove_extra_spaces(str)

# Write the corrected string in the file without_extra_spaces.txt
File.open('without_extra_spaces.txt', 'w') do |file|
  file.write(str)
end

# Count how many words start with "dis" and the search is case insensitive
puts quant_start_with_dis = str.scan(/^dis| dis/i).size
# Count how many words end with "ing" and the search is case insensitive
puts quant_end_with_ing = str.scan(/ing[ .,]/i).size
