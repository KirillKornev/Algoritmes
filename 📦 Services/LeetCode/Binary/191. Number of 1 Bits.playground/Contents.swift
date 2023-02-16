import UIKit

// https://leetcode.com/problems/number-of-1-bits

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var countOfOnes = 0
        var value = n

        for _ in 0..<32 {
            let dight = value & 1

            if dight == 1 {
                countOfOnes += 1
            }

            value = value >> 1
            print(dight as any BinaryInteger)
        }

        return countOfOnes
    }
}

class Solution1 {
    func hammingWeight(_ n: Int) -> Int {
        var countOfOnes = 0
        var value = n

        for _ in 0..<32 {
            let dight = value & 1
            print(dight)

            if dight == 1 {
                countOfOnes += 1
            }

            value = value >> 1
        }

        return countOfOnes
    }
}

let res = Solution1().hammingWeight(0b00000000000000000000000000001011)
