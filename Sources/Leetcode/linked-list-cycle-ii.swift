//
//  linked-list-cycle-ii.swift
//
//
//  Created by Misaka on 2023/8/14.
//

/**
 环形链表 II
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给定一个链表的头节点  head ，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

     如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

     不允许修改 链表。
     */
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast: ListNode? = head
        var slow: ListNode? = head
        var pos = 0
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                break
            }
            pos += 1
        }
        if fast == nil || fast?.next == nil {
            pos = -1
            return nil
        }
        slow = head
        while slow !== fast {
            fast = fast?.next
            slow = slow?.next
        }
        return slow
    }
    
    static func main() {
        let solution = Solution()
        
        // 创建示例1: 有环链表 3->2->0->-4->2(循环)
        let head1 = ListNode(3)
        let node1 = ListNode(2)
        let node2 = ListNode(0)
        let node3 = ListNode(-4)
        head1.next = node1
        node1.next = node2
        node2.next = node3
        node3.next = node1  // 创建环
        
        printTime {
            let result = solution.detectCycle(head1)
            print("示例1: \(result?.val ?? -1)") // 应输出2
        }
        
        // 创建示例2: 有环链表 1->2->1(循环)
        let head2 = ListNode(1)
        let node4 = ListNode(2)
        head2.next = node4
        node4.next = head2  // 创建环
        
        printTime {
            let result = solution.detectCycle(head2)
            print("示例2: \(result?.val ?? -1)") // 应输出1
        }
        
        // 创建示例3: 无环链表
        let head3 = ListNode(1)
        
        printTime {
            let result = solution.detectCycle(head3)
            print("示例3: \(result?.val ?? -1)") // 应输出-1
        }
    }
}
