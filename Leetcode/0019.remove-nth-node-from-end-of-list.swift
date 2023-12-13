//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/14.
//
//  删除链表的倒数第 N 个结点

import Foundation

extension Solution {
    /*
     给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
     */
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var fast: ListNode? = dummy
        for _ in 0 ..< n + 1 {
            fast = fast?.next
        }
        var slow: ListNode? = dummy
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        return dummy.next
    }
}
