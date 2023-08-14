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
    init(_ val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
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
