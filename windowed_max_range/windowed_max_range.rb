#Phase 1 - naive solution
#time complexity: O(n)
#space complexity: O(n^2)

def windowed_max_range_1(array, window_size)
  curr_max = 0
  i = 0
  while i < array.length-window_size+1
    curr_wind = array[i...i+window_size]
    curr_max = [curr_wind.max - curr_wind.min, curr_max].max
    i+=1
  end
  curr_max
end

p windowed_max_range_1([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range_1([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range_1([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range_1([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8