# Call class Array
class Array
  # Add method to generate a histogram
  def to_histogram
    hash = {}
    # Loop to count how many times an element of an array is repeated
    each do |e|
      # If it is the first time that find an element the initial value will be 1 with a key equal to the element
      # If the element exits as a key the value will increase in 1
      hash[e] ? hash[e] += 1 : hash[e] = 1
    end
    puts hash
  end
end

arr = [1,1,2,3,4,5,1,2,3,0,0,0,0]
arr.to_histogram
