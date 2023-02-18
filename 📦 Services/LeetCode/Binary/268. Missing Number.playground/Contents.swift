import UIKit

// https://leetcode.com/problems/missing-number/description/

// MARK: - Non binary solution

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let sortedArray = nums.sorted()
        var lastNumber: Int = .zero

        guard sortedArray.first == 0 else { return .zero }

        for number in sortedArray {
            if number == .zero {
                lastNumber = number
            } else if number == lastNumber + 1 {
                lastNumber = number
            } else {
                return number - 1
            }
        }

        return lastNumber + 1
    }
}

//Solution().missingNumber([3, 0, 1])

// MARK: - Arithmetic progression
// Основано на том, что разница между числами равна одному числу и сложив разницы можно получить пропущенное

class Solution1 {

    func missingNumber(_ nums: [Int]) -> Int {
        var missingNumber = 0
        for i in 1...nums.count {
            missingNumber += i - nums[i-1]
        }
        return missingNumber
    }
}

Solution1().missingNumber([0,1,2,4,5,6])
