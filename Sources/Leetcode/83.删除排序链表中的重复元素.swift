//
//  83.删除排序链表中的重复元素.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//

import Foundation

extension Solution {
    /*
     给定一个已排序的链表的头 head ， 删除所有重复的元素，使每个元素只出现一次 。返回 已排序的链表 。
     */
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while fast != nil {
            if fast!.value != slow!.value {
                slow?.next = fast
                slow = slow?.next
            }
            fast = fast?.next
        }
        
        slow?.next = nil
        
        return head
    }
}
