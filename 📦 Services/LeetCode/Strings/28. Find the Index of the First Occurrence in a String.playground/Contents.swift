import UIKit

// https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/
// https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/solutions/3252411/swift-easy-solution-with-illustration/

class Solution {

    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count <= haystack.count else { return -1 }

        for i in 0...haystack.count - needle.count {
            let slice: ArraySlice<Character> = Array(haystack)[i..<i + needle.count]

            if Array(slice) == Array(needle) { return i }

            print(i)
        }

        return -1
    }
}

Solution().strStr("madbutsad", "sad")
