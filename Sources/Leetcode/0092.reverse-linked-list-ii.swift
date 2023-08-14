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
        
        var successor: ListNode? = nil
        func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
            if n == 1 {
                successor = head?.next
                return head
            }
            let last = reverseN(head, n - 1)
            head?.next?.next = head
            head?.next = successor
            return last
        }
        
        if left == 1 {
            return reverseN(head, right)
        }
        head?.next = reverseBetween(head, left - 1, right - 1)
        return head
    }
}
