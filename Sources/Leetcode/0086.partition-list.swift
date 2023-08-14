//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/14.
//
//  分隔链表

import Foundation

extension Solution {
    /*
     给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。
     
     你应当 保留 两个分区中每个节点的初始相对位置。
     */
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard let head = head else { return nil }
        
        let dummySmaller = ListNode(0)
        let dummyGreaterOrEqual = ListNode(0)
        
        var smaller: ListNode? = dummySmaller
        var greaterOrEqual: ListNode? = dummyGreaterOrEqual
        
        var cur: ListNode? = head
        while cur != nil {
            if cur!.val < x {
                smaller?.next = cur
                smaller = smaller?.next
            } else {
                greaterOrEqual?.next = cur
                greaterOrEqual = greaterOrEqual?.next
            }
            
            cur = cur?.next
        }
        greaterOrEqual?.next = nil
        smaller?.next = dummyGreaterOrEqual.next
        return dummySmaller.next
    }
}
