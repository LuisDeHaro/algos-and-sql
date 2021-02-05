# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  
  indexes = []
  
  nums.each_with_index do |n,i| 
      
    if i == 0
        prev = i
    else
        prev = nums[i - 1]
    end
    
    if ( n + prev ) == target
        indexes << i - 1
        indexes << i
    end
      
  end
  
  indexes

end