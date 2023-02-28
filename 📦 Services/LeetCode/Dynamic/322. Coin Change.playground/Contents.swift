import UIKit

// https://leetcode.com/problems/coin-change/

// MARK: - Dynamic programming

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var values = Array.init(repeating: amount + 1, count: amount + 1)
        values[0] = 0

        for value in 0...amount {
            for coin in coins {
                if coin <= value {
                    values[value] = min(values[value], values[value - coin]  + 1)
                }
            }
        }

        return values[amount]
    }

    func coinChange1(_ coins: [Int], _ amount: Int) -> Int {
        let amountArray = Array(0...amount)
        var dp = Array.init(repeating: amount + 1, count: amount + 1)
        dp[0] = 0

        for i in 0...amount {
            for coin in coins {
                if i - coin < 0 { continue }

                dp[i] = min(dp[i], dp[i-coin] + 1)
            }
        }

        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
}

print(Solution().coinChange1([1, 2, 5], 11))
