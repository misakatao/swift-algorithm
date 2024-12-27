//
//  intersection-of-two-linked-lists.swift
//
//
//  Created by Misaka on 2023/8/7.
//

/**
 相交链表
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。
     */
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var currA: ListNode? = headA
        var currB: ListNode? = headB

        while currA !== currB {
            if currA == nil {
                currA = headB
            } else {
                currA = currA?.next
            }

            if currB == nil {
                currB = headA
            } else {
                currB = currB?.next
            }
        }
        return currA
    }
    
    static func main() {
        let solution = Solution()
        
        // 创建示例1的链表
        let commonNode = ListNode(8)
        commonNode.next = ListNode(4)
        commonNode.next?.next = ListNode(5)
        
        let headA = ListNode(4)
        headA.next = ListNode(1)
        headA.next?.next = commonNode
        
        let headB = ListNode(5)
        headB.next = ListNode(6)
        headB.next?.next = ListNode(1)
        headB.next?.next?.next = commonNode
        
        printTime {
            let result = solution.getIntersectionNode(headA, headB)
            print("示例1: \(result?.val ?? -1)") // 应输出8
        }
        
        // 创建示例2的链表
        let headC = ListNode(2)
        headC.next = ListNode(6)
        headC.next?.next = ListNode(4)
        
        let headD = ListNode(1)
        headD.next = ListNode(5)
        
        printTime {
            let result = solution.getIntersectionNode(headC, headD)
            print("示例2: \(result?.val ?? -1)") // 应输出-1，表示无相交
        }
    }
}
