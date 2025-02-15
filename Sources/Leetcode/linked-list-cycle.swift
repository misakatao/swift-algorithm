//
//  linked-list-cycle.swift
//
//
//  Created by Misaka on 2023/8/14.
//

/**
 环形链表
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个链表的头节点 head ，判断链表中是否有环。

     如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。注意：pos 不作为参数进行传递 。仅仅是为了标识链表的实际情况。

     如果链表中存在环 ，则返回 true 。 否则，返回 false 。
     */
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast: ListNode? = head
        var slow: ListNode? = head
        var pos = 0
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                return true
            }
            pos += 1
        }
        return false
    }
    
    static func main() {
        let solution = Solution()
        let head = ListNode(3)
        head.next = ListNode(2)
        head.next?.next = ListNode(0)
        head.next?.next?.next = ListNode(-4)
        head.next?.next?.next?.next = head.next // Create cycle at position 1
        
        printTime {
            let result = solution.hasCycle(head)
            print("Has cycle: \(result)") // Should print true
        }
        
        let head2 = ListNode(1)
        head2.next = ListNode(2)
        head2.next?.next = head2 // Create cycle at position 0
        
        printTime {
            let result = solution.hasCycle(head2) 
            print("Has cycle: \(result)") // Should print true
        }
        
        let head3 = ListNode(1) // No cycle
        
        printTime {
            let result = solution.hasCycle(head3)
            print("Has cycle: \(result)") // Should print false
        }
    }
}
