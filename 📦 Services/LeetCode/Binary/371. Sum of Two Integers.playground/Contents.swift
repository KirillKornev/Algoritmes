import UIKit

// https://leetcode.com/problems/sum-of-two-integers/submissions/899255378/

// MARK: - Non binary solution. syntax sugar

class Solution1 {

    func getSum(_ a: Int, _ b: Int) -> Int {
        return a.advanced(by: b)
    }
}

// MARK: -

class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var (a, b) = (a, b)

        while b != 0 {
            // Исключаем повторения при сложении
            let xorValue = a ^ b
            // Находим единичку, которая смещается
            let andValue = (a & b) << 1

            (a, b) = (xorValue, andValue)
        }

        return a
    }
}

Solution().getSum(20, 30)
