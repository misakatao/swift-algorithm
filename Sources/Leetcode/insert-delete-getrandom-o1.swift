//
//  insert-delete-getrandom-o1.swift
//
//
//  Created by Misaka on 2023/8/24.
//

/**
 O(1) 时间插入、删除和获取随机元素
 */

import Foundation

class RandomizedSet {
    /*
     实现 RandomizedSet 类：

     RandomizedSet() 初始化 RandomizedSet 对象
     bool insert(int val) 当元素 val 不存在时，向集合中插入该项，并返回 true ；否则，返回 false 。
     bool remove(int val) 当元素 val 存在时，从集合中移除该项，并返回 true ；否则，返回 false 。
     int getRandom() 随机返回现有集合中的一项（测试用例保证调用此方法时集合中至少存在一个元素）。每个元素应该有 相同的概率 被返回。
     你必须实现类的所有函数，并满足每个函数的 平均 时间复杂度为 O(1) 。
     */

    var nums: [Int]

    var valToIndex: [Int: Int]

    init() {
        nums = []
        valToIndex = [:]
    }

    func insert(_ val: Int) -> Bool {
        if let _ = valToIndex[val] {
            return false
        }
        valToIndex[val] = nums.count
        nums.append(val)
        return true
    }

    func remove(_ val: Int) -> Bool {
        guard let index = valToIndex[val] else {
            return false
        }
        let lastIndex = nums.count - 1
        valToIndex[nums[lastIndex]] = index
        nums.swapAt(index, lastIndex)
        nums.removeLast()
        valToIndex.removeValue(forKey: val)
        return true
    }

    func getRandom() -> Int {
        return nums[Int.random(in: 0 ..< nums.count)]
    }
}
