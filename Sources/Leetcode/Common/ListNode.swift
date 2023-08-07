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
    init(_ value: Int = 0, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
    
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
