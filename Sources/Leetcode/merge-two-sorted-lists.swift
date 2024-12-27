//
//  merge-two-sorted-lists.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 21.合并两个有序链表
 
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 */

import Foundation
import Utils

@main
class Solution {
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        var head1: ListNode? = list1
        var head2: ListNode? = list2
        let dummy = ListNode(0)
        var cur: ListNode? = dummy
        while head1 != nil && head2 != nil {
            if head1!.val < head2!.val {
                cur?.next = head1
                head1 = head1?.next
            } else {
                cur?.next = head2
                head2 = head2?.next
            }
            cur = cur?.next
        }
        cur?.next = head1 ?? head2
        return dummy.next
    }
    
    static func main() {
        let solution = Solution()
        
        let testCases = [
            (
                [1, 3, 5, 7, 9],
                [2, 4, 6, 8, 10]
            ),
            (
                [1, 2, 4],
                [1, 3, 4]
            ),
            (
                [],
                []
            ),
            (
                [],
                [0]
            )
        ]
        
        for (i, testCase) in testCases.enumerated() {
            print("\nTest case \(i + 1):")
            let list1 = ListNode.createLinkedList(testCase.0)
            let list2 = ListNode.createLinkedList(testCase.1)
            
            print("Input:")
            print("list1 =", list1?.toString ?? "[]") 
            print("list2 =", list2?.toString ?? "[]")
            
            printTime {
                let result = solution.mergeTwoLists(list1, list2)
                print("\nOutput:", result?.toString ?? "[]")
            }
        }
    }
}
