//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/14.
//
//  反转链表

import Foundation

extension Solution {
    /*
     给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
     */
    func reverseList(_ head: ListNode?) -> ListNode? {
//        var pre: ListNode? = nil
//        var cur: ListNode? = head
//        while cur != nil {
//            let next = cur?.next
//            cur?.next = pre
//            pre = cur
//            cur = next
//        }
//        return pre
        
        if head == nil || head?.next == nil { return nil }
        let last = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return last
    }
}
