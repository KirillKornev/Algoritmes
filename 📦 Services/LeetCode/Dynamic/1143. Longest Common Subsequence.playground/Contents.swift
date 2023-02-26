import UIKit

// https://leetcode.com/problems/longest-common-subsequence/description/

// MARK: - Dynamic

// a(i) == b(j) -> dp[i][j] = dp[i - 1][j - 1] + 1
// a(i) != b(j) -> dp[i][j] = max(dp[i][j - 1] , dp[i - 1][j])

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var array1 = Array(text1)
        var array2 = Array(text2)

        var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)

        for i in 1...array1.count {
            for j in 1...array2.count {
                if array1[i - 1] == array2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }

        return dp[text1.count][text2.count]
    }
}

Solution().longestCommonSubsequence("abc", "def")

