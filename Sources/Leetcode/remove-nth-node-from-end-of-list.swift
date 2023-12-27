//
//  remove-nth-node-from-end-of-list.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 19.删除链表的倒数第 N 个结点
 
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
 */

import Foundation
import Utils

@main
class Solution {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy
        for _ in 0 ... n {
            fast = fast?.next
        }
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        return dummy.next
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let head = ListNode(1)
            head.next = ListNode(3)
            head.next?.next = ListNode(5)
            head.next?.next?.next = ListNode(7)
            head.next?.next?.next?.next = ListNode(9)
            print("示例1: \(s.removeNthFromEnd(head, 3)?.toString ?? "")")
        }
    }
}
