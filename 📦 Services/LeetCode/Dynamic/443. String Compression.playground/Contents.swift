import UIKit

class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        guard chars.count > 1 else { return 1 }
        var tempChar: [(Character, Int)] = [(chars[0], 1)]

        for index in 1..<chars.count {
            let currentChar = chars[index]
            let lastCharValue = tempChar.last!

            if lastCharValue.0 == currentChar {
                tempChar[tempChar.endIndex - 1].1 += 1
            } else {
                tempChar.append((currentChar, 1))
            }
        }

        var result: [Character] = []

        for item in tempChar {
            if item.1 == 1 {
                result.append(item.0)
            } else {
                result.append(item.0)

                let fullNumber = String(item.1)
                let separateNumbers = Array(fullNumber)
                result += separateNumbers
            }
        }

        chars = result
        return result.count
    }
}

var df: [Character] = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]

Solution().compress(&df)
print(df)
