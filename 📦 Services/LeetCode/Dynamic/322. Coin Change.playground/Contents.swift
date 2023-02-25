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
}

Solution().coinChange([1, 2, 5], 11)
