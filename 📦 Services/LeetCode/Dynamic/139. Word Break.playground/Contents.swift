import UIKit

// https://leetcode.com/problems/word-break/description/

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let arrayS = Array(s)
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true

        for i in 1...s.count {
            for j in 0..<i {
                let word = String(Array(arrayS[j..<i]))
                if dp[j] && wordDict.contains(word) {
                    dp[i] = true
                }
            }
        }

        return dp.last!
    }
}

Solution().wordBreak("applepen", ["apple","pen"])
