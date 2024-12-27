//
//  reverse-nodes-in-k-group.swift
//
//
//  Created by Misaka on 2023/8/15.
//

/**
 K 个一组翻转链表
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你链表的头节点 head ，每 k 个节点一组进行翻转，请你返回修改后的链表。

     k 是一个正整数，它的值小于或等于链表的长度。如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

     你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
     */
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        func reverse(_ node: ListNode?, _ otherNode: ListNode?) -> ListNode? {
            var pre: ListNode?
            var cur: ListNode? = node
            while cur !== otherNode {
                let next = cur?.next
                cur?.next = pre
                pre = cur
                cur = next
            }
            return pre
        }

        if head == nil { return head }

        let a: ListNode? = head
        var b: ListNode? = head
        for _ in 0 ..< k {
            if b == nil {
                return head
            }
            b = b?.next
        }
        let last = reverse(a, b)
        a?.next = reverseKGroup(b, k)
        return last
    }
    
    static func main() {
        
    }
}
