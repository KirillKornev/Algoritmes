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

        memo[n] = climbStairs(n - 1) //+ climbStairs(n - 2)
        return memo[n]!
    }
}

Solution2().climbStairs(20)
