import Foundation

class Solution {

    let letters: [Character: [Character]] = [
        "2": ["a","b","c"],
        "3": ["d","e","f"],
        "4": ["g","h","i"],
        "5": ["j","k","l"],
        "6": ["m","n","o"],
        "7": ["p","q","r", "s"],
        "8": ["t","u","v"],
        "9": ["w","x","y", "z"]
    ]

    func backtrack(_ digits: [Character],
                   _ start: Int,
                   _ seq: inout [Character],
                   _ res: inout [[Character]]) {
        // Combination was found
        if seq.count == digits.count {
            res.append(seq)
            return
        }

        for index in start..<digits.count {
            let dight = digits[index]
            let dightsLetters = letters[dight] ?? []

            for ch in dightsLetters {
                seq.append(ch)
                backtrack(digits, index + 1, &seq, &res)
                seq.removeLast()
            }
        }
    }

    func letterCombinations(_ digits: String) -> [String] {
        var seq: [Character] = []
        var res: [[Character]] = []

        backtrack(Array(digits), 0, &seq, &res)

        return res.filter { !$0.isEmpty }.map { String($0) }
    }
}

Solution().letterCombinations("2")
