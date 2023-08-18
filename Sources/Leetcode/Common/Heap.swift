//
//  Heap.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/14.
//

import Foundation

public struct Heap<T> {
    
    private var elements: [T]
    private let priorityFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    init(_ priorityFunction: @escaping (T, T) -> Bool) {
        self.elements = []
        self.priorityFunction = priorityFunction
    }
    
    // MARK: - Public
    mutating func append(_ element: T) {
        elements.append(element)
        siftUp(elements.count - 1)
    }
    
    mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        
        if elements.count == 1 {
            return elements.removeFirst()
        } else {
            let root = elements[0]
            elements[0] = elements.removeLast()
            siftDown(0)
            return root
        }
    }
    
    // MARK: - Private
    private mutating func siftDown(_ index: Int) {
        var parent = index
        
        while true {
            let left = parent * 2 + 1
            let right = parent * 2 + 2
            
            var candidate = parent
            if left < count && priorityFunction(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count && priorityFunction(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private mutating func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && priorityFunction(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
}
