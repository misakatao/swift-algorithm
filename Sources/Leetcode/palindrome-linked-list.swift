//
//  palindrome-linked-list.swift
//
//
//  Created by Misaka on 2023/8/15.
//

/**
 回文链表
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个单链表的头节点 head ，请你判断该链表是否为回文链表。如果是，返回 true ；否则，返回 false 。
     */
    func isPalindrome(_ head: ListNode?) -> Bool {
        var left: ListNode? = head
        func traverse(_ right: ListNode?) -> Bool {
            if right == nil { return true }
            var res = traverse(right?.next)
            res = res && right?.val == left?.val
            left = left?.next
            return res
        }
        return traverse(head)
    }
    
    static func main() {
        
    }
}
