//
//  rotate-list.swift
//  
//
//  Created by Misaka on 2023/12/28.
//

/**
 61. 旋转链表
 
 给你一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置。
 */

import Foundation
import Utils

@main
class Solution {
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return head
        }
        var head = head
        var temp: ListNode? = head
        var len = 1
        while temp?.next != nil {
            temp = temp?.next
            len += 1
        }
        temp?.next = head
        for _ in 0 ..< (len - k % len) {
            temp = temp?.next
        }
        head = temp?.next
        temp?.next = nil
        return head
    }
    
    static func main() {
        let s = Solution()
        printTime {
            let head = ListNode(1)
            head.next = ListNode(2)
            head.next?.next = ListNode(3)
            head.next?.next?.next = ListNode(4)
            head.next?.next?.next?.next = ListNode(5)
            
            let res = s.rotateRight(head, 7)
            PrintUtil.printLinkedList(res)
            print("示例1: \(res?.toString ?? "")")
        }
        printTime {
            let head = ListNode(0)
            head.next = ListNode(1)
            head.next?.next = ListNode(2)
            
            let res = s.rotateRight(head, 4)
            PrintUtil.printLinkedList(res)
            print("示例2: \(res?.toString ?? "")")
        }
    }
}
