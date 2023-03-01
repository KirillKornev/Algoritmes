import UIKit

// https://leetcode.com/problems/edit-distance

// Solution based on Levenshtein distance

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.isEmpty { return word2.count }
        if word2.isEmpty { return word1.count }

        let arrayA = Array(word1)
        let arrayB = Array(word2)
        let row  = arrayA.count + 1
        let column = arrayB.count + 1
        var dp = Array(repeating: Array(repeating: 0, count: column), count: row)

        for i in 0..<row {
            for j in 0..<column {
                if i == 0 {
                    dp[0][j] = j
                } else if j == 0 {
                    dp[i][0] = i
                } else if arrayA[i - 1] == arrayB[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = 1 + min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1])
                }
            }
        }

        return dp[row - 1][column - 1]
    }
}

Solution().minDistance("a", "b")
