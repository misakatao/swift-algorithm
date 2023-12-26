//
//  reverse-linked-list.swift
//  
//
//  Created by Misaka on 2023/12/26.
//

/**
 206.反转链表
 
 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
 */

import Foundation
import Utils

@main
class Solution {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var pre: ListNode? = nil
        var cur: ListNode? = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let head = ListNode(1)
            head.next = ListNode(2)
            head.next?.next = ListNode(3)
            head.next?.next?.next = ListNode(4)
            head.next?.next?.next?.next = ListNode(5)
            print("示例1: \(s.reverseList(head)?.toString ?? "")")
        }
    }
}
