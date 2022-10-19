import UIKit

// Use binary search for finding min element
// Complexity O(logN)

class Solution {
    func findMin(_ nums: [Int]) -> Int {

        var left = 0
        var right = nums.count - 1

        while left < right {

            let mid = (left + right) / 2

            if nums[mid] >= nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }

        return nums[left]
    }
}

Solution().findMin([4,5,6,7,0,1,2])
