import UIKit

// https://leetcode.com/problems/count-subarrays-with-fixed-bounds

// MARK: - Time Limit Exceeded

class Solution {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        let possibleRange = minK...maxK
        var result = 0

        for i in 0..<nums.count {

            for j in i..<nums.count {
                let slice = nums[i...j]

                if !slice.contains { $0 < minK || $0 > maxK }, slice.min() == minK, slice.max() == maxK {
                    print(slice)
                    result += 1
                }
            }
        }

        return result
    }
}

//print(Solution().countSubarrays([1,1,1,1], 1, 1))

// MARK: - Time Limit Exceeded

class Solution1 {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        let possibleRange: [Int] = Array(minK...maxK)

        var result = 0

        for i in 0..<nums.count {
            for j in i..<nums.count {
                let slice = Set(nums[i...j])

                // check that slice locates in range between min and max bounds
                let inPossibleRange = slice.subtracting(possibleRange).isEmpty

                // check that clice contains min and max bounds
                let containsMinAndMax = Set([minK, maxK]).subtracting(slice).isEmpty

                if inPossibleRange, containsMinAndMax {
                    result += 1
                }
            }
        }

        return result
    }
}

//print(Solution1().countSubarrays([1,1,1,1], 1, 1))

// MARK: - Last

class Solution2 {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        var result = 0
        var foundMinBound = false
        var foundMaxBound = false
        var start = 0
        var minStart = 0
        var maxStart = 0

        for i in 0..<nums.count {
            // Out of bounds, go to next
            if nums[i] < minK || nums[i] > maxK {
                foundMinBound = false
                foundMaxBound = false
                start = i + 1
                continue
            }

            // found min value
            if nums[i] == minK {
                foundMinBound = true
                minStart = i
            }

            // found max value
            if nums[i] == maxK {
                foundMaxBound = true
                maxStart = i
            }

            if foundMinBound, foundMaxBound {
                let slice = nums[start...i]
                print(slice)
                result += min(minStart, maxStart) - start + 1
            }
        }

        return result
    }
}

print(Solution2().countSubarrays([1,1,1,1], 1, 1))
