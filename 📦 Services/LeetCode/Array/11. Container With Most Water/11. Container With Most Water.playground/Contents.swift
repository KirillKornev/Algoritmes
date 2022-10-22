import UIKit

// https://leetcode.com/problems/container-with-most-water/

// MARK: - O(n^2) Time Limit Exceeded

class Solution {
    func maxArea(_ height: [Int]) -> Int {

        var maxLength = 0

        for i in 0..<height.count {
            let a = height[i]

            for j in (i+1)..<height.count {
                let b = height[j]
                let length = (j + 1) - (i + 1)
                let res = min(a, b) * length

                maxLength = max(maxLength, res)
            }
        }

        return maxLength
    }
}

Solution().maxArea([1,8,6,2,5,4,8,3,7])

// MARK: - O(n) Success

class Solution1 {
    func maxArea(_ height: [Int]) -> Int {

        var maxLength = 0
        var left = 0
        var right = height.count - 1

        while left < right {
            let value = (right - left) * min(height[left], height[right])
            maxLength = max(maxLength, value)

            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }

        return maxLength
    }
}

Solution1().maxArea([1,8,6,2,5,4,8,3,7])
