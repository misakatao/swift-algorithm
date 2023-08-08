//
//  main.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/1.
//

import Foundation

public class ListNode : Hashable {
    var value: Int
    var next: ListNode?
    init(_ value: Int, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(next)
    }
    
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.value == rhs.value && lhs.next == rhs.next
    }
}
