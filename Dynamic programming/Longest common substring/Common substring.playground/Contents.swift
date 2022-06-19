import UIKit
import Foundation

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double? {
        get {
            guard indexIsValid(row: row, column: column) else { return nil }
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue ?? 0
        }
    }
}

// MARK: - Usage

func compareTwoWords(_ first: String, second: String) -> Double? {
    var matrix = Matrix(rows: first.count, columns: second.count)
    let firstWord = Array(first)
    let secondWord = Array(second)
    
    // rows
    for (firstIndex, firstValue) in firstWord.enumerated() {
        
        // columns
        for (secondIndex, secondValue) in secondWord.enumerated() {
            if firstValue == secondValue {
                let oldValue = matrix[firstIndex - 1, secondIndex - 1] ?? 0
                matrix[firstIndex, secondIndex] = oldValue + 1
            }
            
        }
    }
    
    return matrix.grid.max()
}

_ = compareTwoWords("One", second: "Onk")

// [1.0, 0.0, 0.0,
//  0.0, 2.0, 0.0,
//  0.0, 0.0, 0.0]
