import UIKit

/*
 task: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 Go throught each price and try to find best maxProfit(diff between current price and buying price)
 try to find the lowest buying price for future profit
 
 Compexity O(n)
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }
        
        var maxProfit = 0
        var buy = prices[0]
        
        for currentPrice in prices {
            let currentProfit = currentPrice - buy
            print(currentProfit)
            
            // found a better profit
            if currentProfit > maxProfit {
                maxProfit = currentProfit
            }
            
            // found new lowest price
            if currentPrice < buy {
                buy = currentPrice
            }
        }
        
        return maxProfit
    }
}

_ = Solution().maxProfit([7,1,5,3,6,4])
