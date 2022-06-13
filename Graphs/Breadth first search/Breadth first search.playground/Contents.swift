import UIKit

class Vertex {
    var key: String
    var visited: Bool = false
    var neighbours = [Vertex]()
    
    init(_ key: String) {
        self.key = key
    }
}

func bfs(_ root: Vertex?, target: String) -> Bool {
    guard let root = root else { return false }
    
    var queue = [root]
    root.visited = true
    
    while !queue.isEmpty {
        let vertex = queue.removeFirst()
        print("vertex \(vertex.key)")
        if vertex.key == target { return true }
        
        for neighbour in vertex.neighbours {
            if !neighbour.visited {
                queue.append(neighbour)
                neighbour.visited = true
            }
        }
    }
    
    return false
}

// MARK: - Usage

var kirill = Vertex("Kirill")
var alice = Vertex("Alice")
var clare = Vertex("Clare")
var bob = Vertex("Bob")
var anoodg = Vertex("Anuj")
var tom = Vertex("Tom")
var jonny = Vertex("Johnny")
var peggy = Vertex("Peggy")

kirill.neighbours.append(clare)
kirill.neighbours.append(alice)
kirill.neighbours.append(bob)

bob.neighbours.append(kirill)
bob.neighbours.append(anoodg)

clare.neighbours.append(tom)
clare.neighbours.append(jonny)
clare.neighbours.append(kirill)

alice.neighbours.append(kirill)
alice.neighbours.append(peggy)

anoodg.neighbours.append(bob)

tom.neighbours.append(clare)

jonny.neighbours.append(clare)

peggy.neighbours.append(alice)
peggy.neighbours.append(bob)

bfs(kirill, target: "Alice")
