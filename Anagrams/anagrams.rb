# Anagrams Phase 1

def anagrams_one?(str1, str2)
  arr1 = str1.chars
  
  variations = anagrams_helper(arr1)

  variations.map! {|arr| arr.join}.include?(str2)  
end

def anagrams_helper(arr)
  return [arr] if arr.length <= 1
  result = []
  prev_arr = anagrams_helper(arr[0..-2])
  prev_arr.each do |el|
    (0..prev_arr.length).each do |i|
      result << el[0...i] + [arr[-1]] + (el[i..-1] || [])
    end
  end
  result  
end

p anagrams_helper([0,1,2])
p anagrams_one?("gizmo", "sally")    #=> false
p anagrams_one?("elvis", "lives")    #=> true