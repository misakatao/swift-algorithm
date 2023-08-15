//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/10.
//
//  删除排序链表中的重复元素 II

import Foundation

extension Solution {
    /*
     给定一个已排序的链表的头 head ， 删除原始链表中所有重复数字的节点，只留下不同的数字 。返回 已排序的链表 。
     */
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        let dummy = ListNode(0, head)
        var pre: ListNode? = dummy
        var cur: ListNode? = dummy.next
        while cur != nil && cur?.next != nil {
            if cur?.val == cur?.next?.val {
                let x = cur?.val
                while cur != nil && cur?.val == x {
                    cur = cur?.next
                }
                pre?.next = cur
            } else {
                pre = cur
                cur = cur?.next
            }
        }
        return dummy.next
    }
}
