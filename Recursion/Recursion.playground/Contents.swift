import Cocoa

func summ(of elements: [Int]) -> Int {
    guard !elements.isEmpty else { return 0 }
    if elements.count == 1 { return elements[0] }
    
    let newArray = elements.dropFirst()
    return elements[0] + summ(of: Array(newArray))
}

summ(of: [1, 2, 3])
