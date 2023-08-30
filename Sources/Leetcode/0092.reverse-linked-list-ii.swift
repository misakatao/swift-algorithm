//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/14.
//
//  反转链表 II

import Foundation

extension Solution {
    /*
     给你单链表的头指针 head 和两个整数 left 和 right ，其中 left <= right 。请你反转从位置 left 到位置 right 的链表节点，返回 反转后的链表 。
     */
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        /*
         g       p
         ↓       ↓
         dummy --> _1_ --> _2_ --> 3 --> 4 --> 5

         g         p
         ↓    3    ↓
         dummy --> _1_ ↗   ↘ _2_ --> 4 --> 5

         g               p
         ↓    4          ↓
         dummy --> _1_ ↗   ↘ 3 --> _2_ --> 5
         */
//        let dummy = ListNode(0)
//        dummy.next = head
//
//        var g: ListNode? = dummy // g(guard 守卫)
//        var p: ListNode? = dummy.next // p(point)
//
//        for _ in 0..<left - 1 {
//            g = g?.next
//            p = p?.next
//        }
//
//        for _ in 0..<right - left {
//            let removed = p?.next
//            p?.next = p?.next?.next
//
//            removed?.next = g?.next
//            g?.next = removed
//        }
//        return dummy.next

//        var dummy = ListNode(0)
//        dummy.next = head
//
//        var pre: ListNode? = dummy
//        for _ in 0..<left - 1 {
//            pre = pre?.next
//        }
//
//        var rightNode: ListNode? = pre
//        for _ in 0..<(right - (left - 1)) {
//            rightNode = rightNode?.next
//        }
//
//        var mNode: ListNode? = pre?.next
//        pre?.next = nil
//
//        var suc: ListNode? = rightNode?.next
//        rightNode?.next = nil
//
//        var pre1: ListNode? = nil
//        var cur1: ListNode? = mNode
//        while cur1 != nil {
//            let next = cur1?.next
//            cur1?.next = pre1
//            pre1 = cur1
//            cur1 = next
//        }
//
//        pre?.next = rightNode
//        mNode?.next = suc
//
//        return dummy.next

        var suc: ListNode?
        func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
            if n == 1 { // head == nil || head?.next == nil
                suc = head?.next
                return head
            }
            let last = reverseN(head?.next, n - 1)
            head?.next?.next = head
            head?.next = suc
            return last
        }

        if left == 1 {
            return reverseN(head, right)
        }
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }
}
