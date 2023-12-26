//
//  reverse-linked-list-ii.swift
//  
//
//  Created by Misaka on 2023/12/26.
//

/**
 92.反转链表 II
 
 给你单链表的头指针 head 和两个整数 left 和 right ，其中 left <= right 。请你反转从位置 left 到位置 right 的链表节点，返回 反转后的链表 。
 */

import Foundation
import Utils

@main
class Solution {
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil {
            return head
        }
        let dump = ListNode(0)
        dump.next = head
        
        var g: ListNode? = dump
        var p: ListNode? = dump.next
        
        for _ in 0 ..< left - 1 {
            g = g?.next
            p = p?.next
        }
        
        for _ in 0 ..< (right - left) {
            let next = p?.next
            p?.next = p?.next?.next
            next?.next = g?.next
            g?.next = next
        }
        
        return dump.next
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let head = ListNode(1)
            head.next = ListNode(2)
            head.next?.next = ListNode(3)
            head.next?.next?.next = ListNode(4)
            head.next?.next?.next?.next = ListNode(5)
            print("示例1: \(s.reverseBetween(head, 2, 4)?.toString ?? "")")
        }
    }
}
