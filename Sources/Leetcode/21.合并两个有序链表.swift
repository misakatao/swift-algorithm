//
//  21.合并两个有序链表.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//

import Foundation

extension Solution {
    /*
     将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
     */
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode()
        var cur: ListNode? = dummy
        
        var ls1: ListNode? = list1
        var ls2: ListNode? = list2
        
        while ls1 != nil && ls2 != nil {
            if ls1!.value < ls2!.value {
                cur?.next = ls1
                ls1 = ls1?.next
            } else {
                cur?.next = ls2
                ls2 = ls2?.next
            }
            cur = cur?.next
        }
        cur?.next = ls1 ?? ls2
        
        return dummy?.next
    }
}
