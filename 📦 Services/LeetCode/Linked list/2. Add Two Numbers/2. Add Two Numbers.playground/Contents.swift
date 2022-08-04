import UIKit

/*
 https://leetcode.com/problems/add-two-numbers/

 Idea: save head node and make it copy
 add new nodes ahead and makes sum
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// MARK: - Code

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var head: ListNode? = ListNode()
        var current: ListNode? = head

        var l1Node = l1
        var l2Mode = l2
        var carry = 0

        while l1Node != nil || l2Mode != nil || carry != 0 {
            let l1Val = l1Node?.val ?? 0
            let l2Val = l2Mode?.val ?? 0

            // find summ
            let summ = l1Val + l2Val + carry

            // if value > 10, get an 1
            carry = summ / 10

            // set finded summ to next node
            current?.next = ListNode(summ % 10)

            // move to next node
            l1Node = l1Node?.next
            l2Mode = l2Mode?.next
            current = current?.next
        }

        return head?.next
    }
}

// MARK: - Usage

let l13 = ListNode(3, nil)
let l12 = ListNode(4, l13)
let l11 = ListNode(2, l12)

let l23 = ListNode(4, nil)
let l22 = ListNode(6, l23)
let l21 = ListNode(5, l22)

let result = Solution().addTwoNumbers(l11, l21)

func checkResult() {
    var res = result

    while res != nil {
        print(res?.val)
        res = res?.next
    }
}
checkResult()
