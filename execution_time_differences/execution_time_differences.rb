list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

#phase 1
# time complexity: O(n^2)
# space complexity: O(1)
def my_min_one(array)
  min = array[0] 
  array.each do |el1|
    array.each do |el2|
      min = el2 if el2 < el1 && el2 < min
    end
  end
  min
end

#phase 2
#time complexity: O(n)
# space complexity: O(1)

def my_min_two(array)
  min = array[0] 
  array.each do |el2|
    min = el2 if el2 < min
  end
  min
end

#contiguous sum
#phase 1
# time complexity : O(n^3)
# space complexity: O(n^3)

list1 = [2, 3, -6, 7, -6, 7]

def largest_contiguous_subsum_one(array)
  sub_arrays = []
  array.each_index do |idx1|
    array.each_index do |idx2|
      sub_arrays << array[idx1..idx2] if idx2 >= idx1
    end
  end
  sub_arrays.map {|subarray| subarray.reduce(:+)}.max
end

# phase 2
# time complexity: O(n)
# space complexity: O(1)

def largest_contiguous_subsum_two(array)
  sum = nil
  i = 0
  while i < array.length
    curr_sums = array[i..-1].reduce(:+)
    sum = curr_sums if sum.nil? || curr_sums > sum
    i += 1
  end
  sum
end


p largest_contiguous_subsum_two(list1)