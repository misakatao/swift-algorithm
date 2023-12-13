//
//  ListNode.swift
//  
//
//  Created by Misaka on 2023/12/11.
//

import Foundation

public class ListNode : Hashable {
    
    public var val: Int // 节点值
    public var next: ListNode? // 后继节点引用
    
    public init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
    
    public var toString: String {
        var res: [String] = []
        var cur: ListNode? = self
        while cur != nil {
            res.append(String(cur?.val ?? 0))
            cur = cur?.next
        }
        return "[\(res.joined(separator: ","))]"
    }
    
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val && lhs.next.map { ObjectIdentifier($0) } == rhs.next.map { ObjectIdentifier($0) }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(next.map { ObjectIdentifier($0) })
    }
    
    public static func arrayToLinkedList(arr: [Int]) -> ListNode? {
        let dum = ListNode(0)
        var head: ListNode? = dum
        for val in arr {
            head?.next = ListNode(val)
            head = head?.next
        }
        return dum.next
    }
}
