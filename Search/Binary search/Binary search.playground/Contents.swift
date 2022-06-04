import Foundation

func binarySearch<T: Comparable>(_ list: [T], item: T) -> Bool {
    // Borders
    var leftIndex = 0
    var rightIndex = list.count - 1

    while leftIndex <= rightIndex {
        let midIndex = (leftIndex + rightIndex) / 2
        let midValue = list[midIndex]


        if midValue == item {
            return true
        } else if midValue > item {
            // too much - move right border
            rightIndex = midIndex - 1
        } else {
            // too little - move left border
            leftIndex = midIndex + 1
        }
    }

    return false
}

binarySearch([1, 2, 3, 4, 5], item: 5)
