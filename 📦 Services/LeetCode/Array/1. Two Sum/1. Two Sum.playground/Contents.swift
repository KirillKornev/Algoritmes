import UIKit

/*
 task: https://leetcode.com/problems/two-sum/
 Go throught all elemets in array and compare with other all elemets
 
 for
   for
 
 Compexity O(n^2)
 */

class Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        for i in 0..<nums.count {
            for j in i + 1..<nums.count {
                let firstNumber = nums[i]
                let secondNumber = nums[j]
                
                if firstNumber == target - secondNumber {
                    return [i, j]
                }
            }
        }
            
        return []
    }
}

_ = Solution().twoSum([1, 2, 3], 6)
