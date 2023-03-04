import UIKit

// https://leetcode.com/problems/evaluate-reverse-polish-notation/
// https://leetcode.com/problems/evaluate-reverse-polish-notation/solutions/3255424/easy-swift-solution-with-illustration/

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {

        var stack: [Int] = []

        for token in Array(tokens) {
            // number
            if let int = Int(token) {
                stack.append(int)
            // sign
            } else {
                let sign = token
                let popRight = stack.removeLast()
                let popLeft = stack.removeLast()

                if sign == "+" {
                    let res = popLeft + popRight
                    stack.append(res)
                } else if sign == "-" {
                    let res = popLeft - popRight
                    stack.append(res)
                } else if sign == "*" {
                    let res = popLeft * popRight
                    stack.append(res)
                } else if sign == "/" {
                    let res = popLeft / popRight
                    stack.append(res)
                }
            }
        }

        return stack[0]
    }
}

Solution().evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"])
