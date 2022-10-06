class Array
  def to_histogram
    hash = {}
    each do |e|
      hash[e] ? hash[e] += 1 : hash[e] = 1
    end
    puts hash
  end
end

arr = [1,1,2,3,4,5,1,2,3,0,0,0,0]
arr.to_histogram
