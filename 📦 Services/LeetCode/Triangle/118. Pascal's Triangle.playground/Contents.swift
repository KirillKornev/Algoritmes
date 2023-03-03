import UIKit

// https://leetcode.com/problems/pascals-triangle
// https://leetcode.com/problems/pascals-triangle-ii/

class Solution {
    func pascalTriangle(_ rows: Int) -> [[Int]] {
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

    func getRow(_ rowIndex: Int) -> [Int] {
        let triangle = pascalTriangle(rowIndex + 1)
        return triangle[rowIndex]
    }
}

Solution().getRow(3)
