//
//  merge-two-sorted-lists.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 21.合并两个有序链表
 
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 */

import Foundation
import Utils

@main
class Solution {
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        var head1: ListNode? = list1
        var head2: ListNode? = list2
        let dummy = ListNode(0)
        var cur: ListNode? = dummy
        while head1 != nil && head2 != nil {
            if head1!.val < head2!.val {
                cur?.next = head1
                head1 = head1?.next
            } else {
                cur?.next = head2
                head2 = head2?.next
            }
            cur = cur?.next
        }
        cur?.next = head1 ?? head2
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
            
            let res = s.mergeTwoLists(head, head2)
            PrintUtil.printLinkedList(res)
            print("示例1: \(res?.toString ?? "")")
        }
    }
}
