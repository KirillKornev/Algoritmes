import UIKit

// 159. Longest Substring with At Most Two Distinct Characters
// https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var s = Array(s)
        var res = 0
        var left = 0
        var memory: [Character: Int] = [:]

        for (right, char) in s.enumerated() {
            memory[char, default: 0] += 1

            while memory.keys.count > 2 {
                let leftChar = s[left]
                memory[leftChar, default: 0] -= 1

                if memory[leftChar] == 0 {
                    memory[leftChar] = nil
                }

                left += 1
            }

            res = max(right - left + 1, res)
        }

        return res
    }
}

Solution().lengthOfLongestSubstring("eceba")
