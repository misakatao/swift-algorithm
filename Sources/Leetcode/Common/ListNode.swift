//
//  main.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/1.
//

import Foundation

public class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
    var toString: String {
        var res: [String] = []
        var cur: ListNode? = self
        while cur != nil {
            res.append(String(cur?.val ?? 0))
            cur = cur?.next
        }
        return "[\(res.joined(separator: ","))]"
    }
    /*
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(next)
    }
    
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
     */
}
