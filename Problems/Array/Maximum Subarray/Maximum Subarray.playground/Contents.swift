import UIKit

/*
 task: https://leetcode.com/problems/maximum-subarray/
 Compare previous maxResult and current
 Update for each element, so we can find the maximum subarray
 
 Compexity O(n)
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count != 1 else { return nums[0] }
        
        var maxSum = nums[0]
        var currentSum = nums[0]
        
        for i in 1...nums.count - 1 {
            let num = nums[i]
            
            currentSum = max(currentSum + num, num)
            maxSum = max(currentSum, maxSum)
        }
        
        return maxSum
    }
}

_ = Solution().maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
