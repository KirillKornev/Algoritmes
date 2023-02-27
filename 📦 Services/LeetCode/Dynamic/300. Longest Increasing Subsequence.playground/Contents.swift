import UIKit

// https://leetcode.com/problems/longest-increasing-subsequence/description/

// O(n * m)

// MARK: - Dynamic

func lengthOfLIS(_ nums: [Int]) -> Int {
    var dp = Array.init(repeating: 1, count: nums.count)

    for i in 0..<dp.count{
        for j in 0..<i{
            if nums[j] < nums[i] && dp[i] < dp[j] + 1 {
                dp[i] = dp[j] + 1
            }
        }
    }

    return dp[nums.count - 1]
}

lengthOfLIS([10,9,2,5,3,7,101,18])
