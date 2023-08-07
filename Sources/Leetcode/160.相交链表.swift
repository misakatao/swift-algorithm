//
//  160.相交链表.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//

import Foundation

extension Solution {
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
}
