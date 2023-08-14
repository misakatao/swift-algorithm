//
//  main.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/1.
//

import Foundation

class LinkListSolution {
    // 单链表的倒数第 k 个节点
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        var fast: ListNode? = head
        
        // 将第一个指针向前移动 k 个位置
        for _ in 0..<k {
            fast = fast?.next
        }
        
        var slow: ListNode? = head
        // 同时移动两个指针直到第一个指针到达末尾
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }

    // 删除有序链表中的重复项
    func removeDuplicates(_ head: ListNode?) -> ListNode? {
        
        if head == nil { return nil }
        
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while fast != nil {
            if fast !== slow {
                slow?.next = fast
                slow = slow?.next
            }
            fast = fast?.next
        }
        slow?.next = nil
        return head
    }
}
