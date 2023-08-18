//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/14.
//
//  合并 K 个升序链表

import Foundation

extension Solution {
    /*
     给你一个链表数组，每个链表都已经按升序排列。
     
     请你将所有链表合并到一个升序链表中，返回合并后的链表。
     */
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var minHead: Heap<ListNode> = Heap() { $0.val < $1.val }
        for head in lists {
            var p = head
            while p != nil {
                minHead.append(p!)

                let cur = p?.next
                p?.next = nil
                p = cur
            }
        }

        let dummyNode = ListNode(0)
        var p: ListNode? = dummyNode

        while !minHead.isEmpty {
            let head = minHead.pop()
            p?.next = head
            p = p?.next
        }
        return dummyNode.next
    }
}
