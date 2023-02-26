import UIKit

// https://leetcode.com/problems/climbing-stairs/description/

// MARK: - Time Limit Exceeded

class Solution {

    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }

        return climbStairs(n - 1) + climbStairs(n - 2)
    }
}

//Solution().climbStairs(4)

// MARK: - Accepted

class Solution2 {

    var memo: [Int: Int] = [:]

    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }

        if let value = memo[n] {
            return value
        }

        memo[n] = climbStairs(n - 1) + climbStairs(n - 2)
        return memo[n]!
    }
}

Solution2().climbStairs(20)

// MARK: - Dynamic

class Solution3 {

    func climbStairs(_ n: Int) -> Int {
        if n < 2 { return 1 }

        var dp = Array(0...(n + 1))

        for i in 2...(n + 1) {
            dp[i] = dp[i - 1] + dp[i - 2]
        }

        return dp[n + 1]
    }
}

Solution3().climbStairs(3)
