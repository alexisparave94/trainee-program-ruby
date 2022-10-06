def mean(arr = [])
  return puts 0 if arr.empty?

  puts arr.reduce(0) { |memo, num| memo + num } * 1.0 / arr.size
end

def median(arr = [])
  return puts 0 if arr.empty?

  arr.sort!
  relative_index = arr.size / 2
  if arr.size.even?
    puts (arr[relative_index] + arr[relative_index - 1]) * 1.0 / 2
  else
    puts arr[relative_index]
  end
end

def moda(arr)
  return puts 0 if arr.empty?

  uniq_arr = arr.uniq
  count_arr = uniq_arr.map { |e| [e, arr.count(e)] }.sort_by { |a| -a[1] }
  max_count = count_arr[0][1]
  moda_arr = count_arr.select { |a| a[1] == max_count }
  if moda_arr.size == 1
    p count_arr[0][0]
  else
    p moda_arr.map { |a| a[0] }
  end
end

mean([1,2,3,4,5])
mean([])
median([1,5,4,2,3])
median([])
moda([1,2,4,4,5,6])
moda([1,2,2,3,4,4,5,5])
