import UIKit

// https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/

// Given a string s and an integer k, return the length of the longest substring of s that contains at most k disting characters
// s = eceba    k = 2       (3)
// s = aa       k = 1       (2)

func lengthOfLongestSubstring(_ s: String, _ k: Int) -> Int {
    var s = Array(s)
    var res = 0
    var left = 0
    var memory: [Character: Int] = [:]

    for (right, char) in s.enumerated() {
        memory[char, default: 0] += 1

        while memory.keys.count > k {
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

lengthOfLongestSubstring("aa", 1)
