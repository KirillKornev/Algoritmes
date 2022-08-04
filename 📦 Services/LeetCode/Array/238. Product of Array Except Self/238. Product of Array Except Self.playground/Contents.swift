import UIKit

/*
 task: https://leetcode.com/problems/product-of-array-except-self/
 Get a product of values from left to right
 Get a product of values from right to left
 Get a product of two arrays
 This product will be the result of the task
 
 Compexity O(n)
 */

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var leftResult = Array(repeating: 1, count: nums.count)
        var rightResult = Array(repeating: 1, count: nums.count)
        var result = Array(repeating: 1, count: nums.count)
        
        // Multiply (x) values from left to right
        var left = 1
        for i in 1...nums.count - 1 {
            let newLeft = left * nums[i - 1]
            left = newLeft
            leftResult[i] = newLeft
        }
        
        // Multiply (x) values from right to left
        var right = 1
        for i in (0...nums.count - 2).reversed() {
            let newRight = right * nums[i + 1]
            right = newRight
            rightResult[i] = newRight
        }
        
        // Multiply (x) values of two arrays
        for i in 0...nums.count - 1 {
            let productOfArrays = leftResult[i] * rightResult[i]
            result[i] = productOfArrays
        }
        
        return result
    }
}

_ = Solution().productExceptSelf([1,2,3,4])
