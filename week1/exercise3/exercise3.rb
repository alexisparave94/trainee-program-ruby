# Method to calculate the mean of an array of numbers
def mean(arr = [])
  # Method will return a value of 0 if the array is empty
  return 0 if arr.empty?

  # The reduce method calculate the addition of numbres
  # Then the result is divide by the number of numbers
  arr.reduce(0) { |memo, num| memo + num } * 1.0 / arr.size
end

# Method to calculate the median
def median(arr = [])
  # Method will return a value of 0 if the array is empty
  return 0 if arr.empty?

  # Firt sort the array
  arr.sort!
  # Variable to have a reference of the middle term of the array
  relative_index = arr.size / 2

  # If the size is even there are two middle terms so you calculate the median in this way
  if arr.size.even?
    (arr[relative_index] + arr[relative_index - 1]) * 1.0 / 2
  # If the size in't even the median is the term locatad in relative_index variable
  else
    arr[relative_index]
  end
end

# Method to calculate the mode
def mode(arr)
  # Method will return a value of 0 if the array is empty
  return 0 if arr.empty?

  # Generate an array with non-repeating values
  uniq_arr = arr.uniq

  # Generate an array that save the element and the number of times it appears
  # Then the array is sorted descending by the number of times it appears
  count_arr = uniq_arr.map { |e| [e, arr.count(e)] }.sort_by { |a| -a[1] }
  # max_count save the maximum frecuency
  max_count = count_arr[0][1]
  # This chunk of code is return a number or an array if there are more than one mode
  mode_arr = count_arr.select { |a| a[1] == max_count }
  if mode_arr.size == 1
    count_arr[0][0]
  else
    mode_arr.map { |a| a[0] }.sort
  end
end

# p mean([1,2,3,4,5])
# p mean([])
# p median([1,5,4,2,3])
# p median([])
# p mode([1,2,4,4,5,6])
# p mode([1,2,2,3,4,4,5,5])
