import UIKit

// https://leetcode.com/problems/house-robber/
// https://leetcode.com/problems/house-robber-ii/

// First task - find best solution for each home
// Second task - find solution for 2 subarrays [0...i-1] and [1...i], because last homes is connected

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        if nums.count == 1 { return nums[0] }

        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])

        for i in 2..<nums.count {
            dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
        }

        return dp[nums.count - 1]
    }

    func robII(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        if nums.count == 1 { return nums[0] }

        let firstSubArray = Array(nums[1...nums.count - 1])
        let lastSubArray = Array(nums[0...nums.count - 2])

        return max(rob(firstSubArray), rob(lastSubArray))
    }
}

Solution().robII([2,3,2])
