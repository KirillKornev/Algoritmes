import UIKit

// https://leetcode.com/problems/running-sum-of-1d-array

class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var result: [Int] = nums

        for i in 0..<nums.count - 1 {
            result[i + 1] = result[i] + nums[i + 1]
        }

        return result
    }
}

Solution().runningSum([1,2,3,4])
