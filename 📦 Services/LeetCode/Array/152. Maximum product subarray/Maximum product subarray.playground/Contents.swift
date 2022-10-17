import UIKit

// O(n)
// https://leetcode.com/problems/maximum-product-subarray/

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var currentProduct = nums[0]
        var maxProduct = nums[0]

        for i in 1...nums.count - 1 {
            let num = nums[i]

            currentProduct = max(currentProduct * num, num)
            maxProduct = max(currentProduct, maxProduct)
        }

        return maxProduct
    }
}

Solution().maxProduct([2,3,-2, 4])
