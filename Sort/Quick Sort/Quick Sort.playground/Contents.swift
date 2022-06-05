import Foundation

func quickSort<T: Comparable>(_ array: [T]) -> [T] {
    guard !array.isEmpty else { return [] }
    
    var less = [T]()
    var pivot = [T]()
    var greater = [T]()
    
    let pivotItem = array.randomElement() ?? array[0]
    
    for item in array {
        
        if item == pivotItem {
            pivot.append(item)
        }
        
        if item < pivotItem {
            less.append(item)
        }
        
        if item > pivotItem {
            greater.append(item)
        }
    }
    
    return quickSort(less) + pivot + quickSort(greater)
}

quickSort([10, 5, 2, 3, 6, 17, 10, 7, 6])
