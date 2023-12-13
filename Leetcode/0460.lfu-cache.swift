//
//  swift-algorithm
//
//  Created by Misaka on 2023/9/25.
//
//  LFU 缓存

import Foundation

class LFUCache {
    /*
     请你为 最不经常使用（LFU）缓存算法设计并实现数据结构。
     
     实现 LFUCache 类：
     
     LFUCache(int capacity) - 用数据结构的容量 capacity 初始化对象
     int get(int key) - 如果键 key 存在于缓存中，则获取键的值，否则返回 -1 。
     void put(int key, int value) - 如果键 key 已存在，则变更其值；如果键不存在，请插入键值对。当缓存达到其容量 capacity 时，则应该在插入新项之前，移除最不经常使用的项。在此问题中，当存在平局（即两个或更多个键具有相同使用频率）时，应该去除 最近最久未使用 的键。
     为了确定最不常使用的键，可以为缓存中的每个键维护一个 使用计数器 。使用计数最小的键是最久未使用的键。
     
     当一个键首次插入到缓存中时，它的使用计数器被设置为 1 (由于 put 操作)。对缓存中的键执行 get 或 put 操作，使用计数器的值将会递增。
     
     函数 get 和 put 必须以 O(1) 的平均时间复杂度运行。
     */
    
    class Node {
        var key: Int
        var value: Int
        var freq: Int
        var pre: Node?
        var next: Node?
        
        init(_ key: Int = -1, _ value: Int = -1, _ freq: Int = -1) {
            self.key = key
            self.value = value
            self.freq = freq
        }
        
        func updateValue(_ value: Int) {
            self.value = value
        }
        
        func incrFreq() {
            freq += 1
        }
    }
    
    class LinkedList {
        var head: Node
        var tail: Node
        
        init() {
            head = Node()
            tail = Node()
            head.next = tail
            tail.pre = head
        }
        
        func insertFirst(_ node: Node) {
            node.next = head.next
            head.next?.pre = node
            node.pre = head
            head.next = node
        }
        
        func deleteNode(_ node: Node) {
            node.pre?.next = node.next
            node.next?.pre = node.pre
            node.pre = nil
            node.next = nil
        }
        
        func getLastNode() -> Node? {
            if head.next === tail {
                return Node()
            }
            return tail.pre
        }
        
        func isEmpty() -> Bool {
            return head.next === tail
        }
    }
    
    var keyMap = [Int: Node]()
    var freqMap = [Int: LinkedList]()
    let capacity: Int
    var minFreq = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = keyMap[key] else {
            return -1
        }
        increment(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = keyMap[key] {
            node.updateValue(value)
            increment(node)
        } else {
            if capacity == 0 {
                return
            }
            if keyMap.count == capacity {
                removeMinFreqNode()
            }
            let node = Node(key, value, 1)
            increment(node, true)
            keyMap[key] = node
        }
    }
    
    private func increment(_ node: Node, _ isNewNode: Bool = false) {
        if isNewNode {
            minFreq = 1
            insertToLinkedList(node)
        } else {
            deleteNode(node)
            node.incrFreq()
            insertToLinkedList(node)
            if freqMap[minFreq] == nil {
                minFreq += 1
            }
        }
    }
    
    private func insertToLinkedList(_ node: Node) {
        if freqMap[node.freq] == nil {
            freqMap[node.freq] = LinkedList()
        }
        let linkedList = freqMap[node.freq]!
        linkedList.insertFirst(node)
    }
    
    private func deleteNode(_ node: Node) {
        if let linkedList = freqMap[node.freq] {
            linkedList.deleteNode(node)
            if linkedList.isEmpty() {
                freqMap[node.freq] = nil
            }
        }
    }
    
    private func removeMinFreqNode() {
        if let linkedList = freqMap[minFreq], let node = linkedList.getLastNode() {
            linkedList.deleteNode(node)
            keyMap[node.key] = nil
            if linkedList.isEmpty() {
                freqMap[minFreq] = nil
            }
        }
    }
}
