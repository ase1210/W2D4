# Anagrams Phase 1
#time complexity: O(n!)
#space complexity: O(n!)

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

# p anagrams_helper([0,1,2])

# Anagrams Phase 2
#time complexity: O(n^2)
#space complexity: O(n)

def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars
  
  arr1.each do |ch| 
    ch_idx = arr2.index(ch)
    return false if arr2.empty?
    arr2.delete_at(ch_idx) if ch_idx
  end
  
  arr2.empty?
  
  
end

#Anagrams Phase 3
#time complexity: O(n log n)
#space complexity: O(n)

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end


# Anagrams Phase 4
#time complexity: O(n log n)
#space complexity: O(1)

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char {|ch| hash1[ch]+=1}
  str2.each_char {|ch| hash2[ch]+=1}
  
  hash1.sort_by {|k, v| k}.to_a == hash2.sort_by {|k, v| k}.to_a
end

# Bonus Phase 4
#time complexity: O(n)
#space complexity: O(1)

def fourth_anagram_2?(str1, str2)
  hash1 = Hash.new(0)
  str1.each_char {|ch| hash1[ch]+=1}
  str2.each_char {|ch| hash1[ch]-=1}

  hash1.values.all?{|n|n == 0}
end


hash1 = {one: 1, two: 2, three: 3}
hash2 = {one: 1, three: 3, two: 2}
p hash1 == hash2
# p fourth_anagram_2?("gizmo", "sally")    #=> false
# p fourth_anagram_2?("elvis", "lives")    #=> true