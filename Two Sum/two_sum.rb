require 'set'
# Two Sum

# Brute Force
# time complextiy: O(n^2)
# space complextiy: O(n^2)
def bad_two_sum?(arr, target)
  sums = []
  arr.each_index do |i|
    (i+1...arr.length).each do |j|
      sums << arr[i] + arr[j]
    end
  end
  sums.include?(target)
end

# Sorting
#time complexity O(n log n)
#space complexity O(n)

def okay_two_sum?(arr, target)
  sorted = arr.sort 
  arr.each_with_index do |el, idx|
    new_arr = arr[0...idx]+arr[idx+1..-1]
    result = my_bs(new_arr, target-el)
    return true if result
  end
  false
end

def my_bs(array, target)
  return nil if array.length == 1 && array[0] != target
  mid = array.length/2
  
  if array[mid] == target
    return mid 
  elsif target < array[mid]
    return my_bs(array[0...mid], target)
  else
    result = my_bs(array[mid+ 1..-1], target)
    if result 
      return mid + 1 + result 
    else 
      return nil
    end
  end
end

arr = [0, 1, 5, 7]

# Hash Map
# time complexity O(n)
# space complexity O(1)
def two_sum?(arr, target)
  s1 = Set.new 
  arr.each_with_index do |el, idx|
    return true if s1.include?(target-el)
    s1.add(el)
  end
  false
end

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

