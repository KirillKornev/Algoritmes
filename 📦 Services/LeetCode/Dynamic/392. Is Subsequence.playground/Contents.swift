import UIKit

// https://leetcode.com/problems/is-subsequence/description/
// O(n * m)

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {

        if s == t { return true }
        if t.count == 0 { return false }
        if s.count == 0 { return true }

        var sArray = Array(s)
        var tArray = Array(t)

        var dp = Array(repeating: Array(repeating: 0, count: t.count + 1), count: s.count + 1)

        for i in 1...s.count {
            for j in 1...t.count {
                if sArray[i - 1] == tArray[j - 1] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }

        if dp[s.count][t.count] == s.count {
            return true
        } else {
            return false
        }
    }
}

Solution().isSubsequence("axc", "ahbgdc")
