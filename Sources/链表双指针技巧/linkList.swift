//
//  main.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/1.
//

import Foundation

extension Solution {
    
    // 合并两个有序链表
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        let dummy = ListNode(0)
        var cur: ListNode? = dummy
                
        var l1 = list1
        var l2 = list2
        
        while l1 != nil && l2 != nil {
            if l1!.value <= l2!.value {
                cur?.next = l1
                l1 = l1?.next
            } else {
                cur?.next = l2
                l2 = l2?.next
            }
            
            cur = cur?.next
        }
        
        cur?.next = l1 ?? l2
        
        return dummy.next
    }

    // 将链表按给定值划分
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let dummySmaller = ListNode(0)
        let dummyGreaterOrEqual = ListNode(0)
        
        var smaller: ListNode? = dummySmaller
        var greaterOrEqual: ListNode? = dummyGreaterOrEqual
        
        var cur: ListNode? = head
        while cur != nil {
            if cur!.value < x {
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

    // 合并 k 个有序链表
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        var pointers: [ListNode?] = lists
        let dummyNode = ListNode(0)
        var cur: ListNode? = dummyNode
        
        while true {
            var minNode: ListNode? = nil
            var minIndex = -1
            
            for i in 0..<pointers.count {
                let node = pointers[i]
                if let val = node?.value {
                    if minNode == nil || val < minNode!.value {
                        minNode = node
                        minIndex = i
                    }
                }
            }
            
            if minNode == nil {
                break
            }
            
            cur?.next = minNode
            cur = cur?.next
            
            pointers[minIndex] = minNode?.next
        }
        
        return dummyNode.next
    }

    // 单链表的倒数第 k 个节点
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        var fast: ListNode? = head
        
        // 将第一个指针向前移动 k 个位置
        for _ in 0..<k {
            fast = fast?.next
        }
        
        var slow: ListNode? = head
        // 同时移动两个指针直到第一个指针到达末尾
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }

    // 单链表的中点
    func middleNode(_ head: ListNode?) -> ListNode? {
        
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }

    // 如果链表中含有环，如何计算这个环的起点？
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow == fast {
                break
            }
        }
        
        slow = head
        while fast != slow {
            fast = fast?.next
            slow = slow?.next
        }
        
        return slow
    }

    // 判断两个链表是否相交
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        var currA: ListNode? = headA
        var currB: ListNode? = headB
        
        while currA !== currB {
            if currA != nil {
                currA = headB
            } else {
                currA = currA?.next
            }
            
            if currB != nil {
                currB = headA
            } else {
                currB = currB?.next
            }
        }
        
        return currA ?? currB
    }

    //删除有序数组中的重复项
    func removeDuplicates(_ head: ListNode?) -> ListNode? {
        
        if head == nil { return nil }
        
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while fast != nil {
            if fast !== slow {
                slow?.next = fast
                slow = slow?.next
            }
            fast = fast?.next
        }
        slow?.next = nil
        return head
    }
}
