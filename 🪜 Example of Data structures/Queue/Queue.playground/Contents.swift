import Foundation

struct Queue<T> {
    
    private var elements: [T] = []
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
    
    var head: T? {
        elements.first
    }
    
    var tail: T? {
        elements.last
    }
}

// usage
var queue = Queue<Int>()
queue.enqueue(5)
queue.enqueue(2)
queue.dequeue()
queue.dequeue()
queue.dequeue()
