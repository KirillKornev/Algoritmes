import UIKit

// https://leetcode.com/problems/pascals-triangle/description/

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var rowsItems: [[Int]] = []

        for row in 0..<rows {
            var currentResult: [Int] = []

            for item in 0...row {

                if (row > 1 && item > 0 && item < row) {
                    let value = rowsItems[row - 1][item] + rowsItems[row - 1][item - 1]
                    currentResult.append(value)
                } else {
                    currentResult.append(1)
                }
            }

            rowsItems.append(currentResult)
        }

        return rowsItems
    }
}
