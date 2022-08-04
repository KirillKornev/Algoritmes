import UIKit

/*
 https://leetcode.com/problems/valid-parentheses/
 Idea:
 make push to stack with open bracekts
 make pop to stack with close brackets

 if stack is not empty at the end - false

 _____________________
 Example1 ()[]{}

 push ( | [(]
 pop  ) | []

 push [ | [[]
 pop  ] | []

 push { | [{]
 pop  } | []

 _____________________
 Example 2 ")()"

 push ) | [)]
 push ( | [)(]
 pop  ) | [)]
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count > 1 else { return false }
        var stack: [Character] = []

        var bracketsDict: [Character: Character] = [
            "]": "[",
            ")" : "(",
            "}": "{"
        ]

        for character in s {
            // isOpen
            if bracketsDict.values.contains(character) {
                // make push
                stack.append(character)
                continue
            }

            // isClose
            if bracketsDict.keys.contains(character), let peek = stack.last, peek == bracketsDict[character] {
                // make pop
                stack.removeLast()
            } else {
                // first close bracket
                stack.append(character)
            }
        }

        return stack.isEmpty
    }
}

Solution().isValid(")()")
