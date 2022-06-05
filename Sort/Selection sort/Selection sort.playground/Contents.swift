import Foundation

func findSmallestIndex<T: Comparable>(_ array: [T]) -> Int {
    var smallestValue = array[0]
    var smallestIndex = array.startIndex
    
    for index in 0...(array.count - 1) {
        let value = array[index]
        
        if value < smallestValue {
            // found new smallest value
            smallestValue = value
            smallestIndex = index
        }
    }
    return smallestIndex
}

func selectionSort<T: Comparable>(_ array: [T]) -> [T] {
    var startedArray = array
    var sortedArray: [T] = []
    
    while !startedArray.isEmpty {
        let smallestIndex = findSmallestIndex(startedArray)
        let smallestValue = startedArray.remove(at: smallestIndex)
        sortedArray.append(smallestValue)
    }
    
    return sortedArray
}

selectionSort([5, 1, 3 ])
