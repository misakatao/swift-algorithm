//
//  remove-duplicates-from-sorted-list.swift
//
//
//  Created by Misaka on 2023/8/7.
//

/**
 删除排序链表中的重复元素
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给定一个已排序的链表的头 head ， 删除所有重复的元素，使每个元素只出现一次 。返回 已排序的链表 。
     */
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }

//        var fast: ListNode? = head
//        var slow: ListNode? = head
//        while fast != nil {
//            if fast!.val != slow!.val {
//                slow?.next = fast
//                slow = slow?.next
//            }
//            fast = fast?.next
//        }
//        slow?.next = nil
//        return head

        var cur: ListNode? = head
        while cur != nil, cur?.next != nil {
            if cur?.val == cur?.next?.val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        return head
    }
    
    static func main() {
        
    }
}
