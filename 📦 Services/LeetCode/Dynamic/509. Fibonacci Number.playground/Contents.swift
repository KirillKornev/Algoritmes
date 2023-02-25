import UIKit

// https://leetcode.com/problems/fibonacci-number/description/

// MARK: - Orginary fibonachy

func fib(_ n: Int) -> Int {
    guard n > 1 else { return n }
    return fib(n - 1) + fib(n - 2)
}

fib(11)

// MARK: - Optimized fibonachy

var dict: [Int: Int] = [:]

func fib2(_ n: Int) -> Int {
    guard n > 1 else { return n }

    dict[n] = (dict[n - 1] ?? fib2(n - 1)) + (dict[n - 2] ?? fib2(n - 2))

    return dict[n]!
}

fib2(4)
