//
//  merge-k-sorted-lists.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 23.合并 K 个升序链表
 
 给你一个链表数组，每个链表都已经按升序排列。

 请你将所有链表合并到一个升序链表中，返回合并后的链表。
 */

import Foundation
import Utils

@main
class Solution {
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        let dummy = ListNode(0)
        
        for head in lists {
            var p: ListNode? = head
            while p != nil {
                p = p?.next
            }
        }
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
            
            let head2 = ListNode(2)
            head2.next = ListNode(4)
            head2.next?.next = ListNode(6)
            head2.next?.next?.next = ListNode(8)
            head2.next?.next?.next?.next = ListNode(10)
            
            print("示例1: \(s.mergeKLists([head, head2])?.toString ?? "")")
        }
    }
}
