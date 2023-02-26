import UIKit

// https://leetcode.com/problems/unique-paths/

// MARK: - Dynamic

// K[i][j] = a[i - 1][j] + b[i][j - 1]

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        dp[1][1] = 1

        for i in 1...m {
            for j in 1...n {
                if i == 1, j == 1 {
                    continue
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }

        return dp[m][n]
    }
}

Solution().uniquePaths(3, 7)
