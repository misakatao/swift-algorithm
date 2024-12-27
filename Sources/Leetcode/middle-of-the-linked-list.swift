//
//  middle-of-the-linked-list.swift
//
//
//  Created by Misaka on 2023/8/14.
//

/**
 链表的中间结点
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你单链表的头结点 head ，请你找出并返回链表的中间结点。

     如果有两个中间结点，则返回第二个中间结点。
     */
    func middleNode(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head

        var fast: ListNode? = dummy
        var slow: ListNode? = head
        while fast != nil, fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    
    static func main() {
        
    }
}
