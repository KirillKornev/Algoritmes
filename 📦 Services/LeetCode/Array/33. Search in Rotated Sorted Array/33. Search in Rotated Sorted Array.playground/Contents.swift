import UIKit

// Complexity O(logN)

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }

        var left = 0
        var right = nums.count - 1

        while left <= right {
            let middle = (left + right) / 2

            // found value
            if nums[middle] == target {
                return middle
            }

            if nums[middle] <= right {
                // right half is sorted
                if target >= nums[middle], target <= nums[right] {
                    left = middle + 1
                } else {
                    right = middle - 1
                }

            } else if nums[middle] >= nums[left] {
                // left half is sorted
                if target >= nums[middle], target < nums[middle] {
                    right = middle - 1
                } else {
                    left = middle + 1
                }
            }
        }

        return -1
    }
}

Solution().search([4,5,6,7,0,1,2], 0)
