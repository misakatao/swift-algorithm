//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/10.
//
//  两数相加

import Foundation
import Utils

@main
class Solution {
    /*
     给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

     请你将两个数相加，并以相同形式返回一个表示和的链表。

     你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var cur: ListNode? = dummy

        var node1: ListNode? = l1
        var node2: ListNode? = l2
        var carry = 0 // 记录进位
        while node1 != nil || node2 != nil || carry > 0 {
            var add = carry
            if node1 != nil {
                add += node1!.val
                node1 = node1?.next
            }

            if node2 != nil {
                add += node2!.val
                node2 = node2?.next
            }

            carry = add / 10
            cur?.next = ListNode(add % 10)
            cur = cur?.next
        }
        return dummy.next
    }
    
    static func main() {
        
        let s = Solution()

        let head1 = ListNode(2)
        head1.next = ListNode(4)
        head1.next?.next = ListNode(3)

        let head2 = ListNode(5)
        head2.next = ListNode(6)
        head2.next?.next = ListNode(4)

        print("耗时: \(Utils.measureTime { print("示例1: \(s.addTwoNumbers(head1, head2)?.toString ?? "")") }) ms")
    }
}
