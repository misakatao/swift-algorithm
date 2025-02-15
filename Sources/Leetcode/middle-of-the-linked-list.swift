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
        let solution = Solution()
        
        let testCases = [
            [1, 2, 3, 4, 5],
            [1, 2, 3, 4, 5, 6],
            [1],
            [1, 2]
        ]
        
        for (i, testCase) in testCases.enumerated() {
            print("\nTest case \(i + 1):")
            let head = ListNode.createLinkedList(testCase)
            
            print("Input:")
            print("head =", head?.toString ?? "[]")
            
            printTime {
                let result = solution.middleNode(head)
                print("\nOutput:", result?.toString ?? "[]")
            }
        }
    }
}
