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
        var head: ListNode? = ListNode(0)
        var current: ListNode? = head

        var l1 = l1
        var l2 = l2
        var carry = 0

        while l1 != nil || l2 != nil || carry > 0 {
            let l1Val = l1?.val ?? 0
            let l2Val = l2?.val ?? 0
            let sum = l1Val + l2Val + carry

            carry = sum / 10

            current?.next = ListNode(sum % 10)
            l1 = l1?.next
            l2 = l2?.next
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

