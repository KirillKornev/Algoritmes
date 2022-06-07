import Foundation

extension String {
    
    var alphabet: [Character] {
        ["A", "B", "C", "D", "E", "F", "G",
         "H", "I", "J", "K", "L", "M", "N",
         "O", "P", "Q", "R", "S", "T", "U",
         "V","W", "X", "Y", "Z"]
    }
    
    static var alphabetCount: Int {
        26
    }
    
    /// Return hash value - index for first letter in a word
    var fakeHash: Int {
        guard let character = self.capitalized.first else { return 0 }

        return alphabet.firstIndex(of: character) ?? 0
    }
}

class Node {
    var key: String
    var value: String
    
    var next: Node?
    
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

class LinkedList {
    private var head: Node?
    private var tail: Node?
    
    func insertLast(value: String, for key: String) {
        let newNode = Node(key: key, value: value)
        newNode.value = value
        
        if head == nil {
            head = newNode
        } else {
            tail?.next = newNode
        }
        
        tail = newNode
    }
    
    func findValue(_ key: String) -> String? {
        if head?.key == key { return head?.value}
        
        var currentNode = head
        
        while currentNode != nil {
            let currentKey = currentNode?.key
            
            if currentKey == key {
                return currentNode?.value
            }
            
            currentNode = currentNode?.next
        }
        
        return nil
    }
}

class Dictionary {
    
    private var array = Array(repeating: LinkedList(), count: String.alphabetCount)
    
    func setValue(_ value: String, for key: String) {
        let index = key.fakeHash
        array[index].insertLast(value: value, for: key)
    }
    
    func getValue(for key: String) -> String? {
        let index = key.fakeHash
        return array[index].findValue(key)
    }
}

let dict = Dictionary()
dict.setValue("Apple", for: "a")
dict.getValue(for: "a")

dict.setValue("Something", for: "b")
dict.getValue(for: "b")

dict.setValue("Something new", for: "bc")
dict.getValue(for: "bc")
