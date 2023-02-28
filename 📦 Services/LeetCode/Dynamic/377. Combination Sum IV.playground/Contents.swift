import UIKit

class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var dp = Array(repeating: 0, count: target + 1)
        dp[0] = 1
        print(dp)

        for i in 0..<target + 1 {
            for num in nums {
                if i >= num {
                    dp[i] += dp[i - num]
                }
            }
        }

        return dp[target]
    }
}

Solution().combinationSum4([1, 2, 3], 4)
