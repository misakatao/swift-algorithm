//
//  Heap.swift
//  
//
//  Created by Misaka on 2023/12/13.
//

/**
 最大/小 堆
 */

import Foundation
import Utils

public class Heap<T: Comparable> {
    
    private var elements: [T]
    
    private let priorityFunction: ((T, T) -> Bool)
    
    init(_ nums: [T] = [], _ priorityFunction: @escaping ((T, T) -> Bool)) {
        self.elements = nums
        self.priorityFunction = priorityFunction
        for i in stride(from: parent(size - 1), through: 0, by: -1) {
            siftDown(i)
        }
    }
    
    /// 获取左子节点索引
    private func left(_ i: Int) -> Int {
        2 * i + 1
    }
    
    /// 获取右子节点索引
    private func right(_ i: Int) -> Int {
        2 * i + 2
    }
    
    /// 获取父节点索引
    private func parent(_ i: Int) -> Int {
        (i - 1) / 2
    }
    
    /// 交换元素
    private func swap(_ i: Int, _ j: Int) {
        elements.swapAt(i, j)
    }
    
    /// 从节点 i 开始，从底至顶堆化
    private func siftUp(_ i: Int) {
        var child = i
        while true {
            let p = parent(child)
            if p < 0 || !priorityFunction(elements[child], elements[p]) {
                break
            }
            swap(child, p)
            child = p
        }
    }
    
    /// 从节点 i 开始，从顶至底堆化
    private func siftDown(_ i: Int) {
        var i = i
        while true {
            // 判断节点 i, left, right 中值最大的节点，记为 ma
            let left = left(i)
            let right = right(i)
            var ma = i
            if left < size, priorityFunction(elements[left], elements[ma]) {
                ma = left
            }
            if right < size, priorityFunction(elements[right], elements[ma]) {
                ma = right
            }
            // 若节点 i 最大或索引 left, right 越界，则无须继续堆化，跳出
            if ma == i {
                break
            }
            swap(i, ma)
            i = ma
        }
    }
    
    /// 元素入堆
    public func push(_ val: T) {
        elements.append(val)
        siftUp(size - 1)
    }
    
    /// 元素出堆
    public func pop() -> T {
        if isEmpty {
            fatalError("Heap is empty.")
        }
        // 交换根节点与最右叶节点（交换首元素与尾元素）
        swap(0, size - 1)
        // 删除节点
        let val = elements.remove(at: size - 1)
        // 从顶至底堆化
        siftDown(0)
        return val
    }
    
    /// 访问堆顶元素
    public func peek() -> T {
        elements[0]
    }
    
    /// 获取堆大小
    public var size: Int {
        elements.count
    }
    
    /// 判断堆是否为空
    public var isEmpty: Bool {
        size == 0
    }
    
    public var unordered: [T] {
        Array(elements)
    }
    
    public func print() {
        PrintUtil.printHeap(elements)
    }
}

@main
class Solution {
    
    static func main() {
        /* 初始化大顶堆 */
        let maxHeap = Heap<Int>([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]) { $0 < $1 }
        print("\n输入列表并建堆后")
        maxHeap.print()

        /* 获取堆顶元素 */
        var peek = maxHeap.peek()
        print("\n堆顶元素为 \(peek)")

        /* 元素入堆 */
        let val = 7
        maxHeap.push(val)
        print("\n元素 \(val) 入堆后")
        maxHeap.print()

        /* 堆顶元素出堆 */
        peek = maxHeap.pop()
        print("\n堆顶元素 \(peek) 出堆后")
        maxHeap.print()

        /* 获取堆大小 */
        print("\n堆元素数量为 \(maxHeap.size)")

        /* 判断堆是否为空 */
        print("\n堆是否为空 \(maxHeap.isEmpty)")
    }
}
