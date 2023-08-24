//
//  Difference.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/24.
//

import Foundation

public class Difference {
    
    private var diff: [Int] // 差分数组
    
    /* 输入一个初始数组，区间操作将在这个数组上进行 */
    init(_ nums: [Int]) {
        diff = Array(repeating: 0, count: nums.count)
        // 根据初始数组构造差分数组
        for i in 1..<nums.count {
            diff[i] = nums[i] - nums[i - 1]
        }
    }
    
    /* 给闭区间 [i, j] 增加 val（可以是负数）*/
    public func increment(_ i: Int, _ j: Int, _ val: Int) {
        diff[i] += val
        if j + 1 < diff.count {
            diff[j + 1] -= val
        }
    }
    
    /* 返回结果数组 */
    public func result() -> [Int] {
        var res: [Int] = Array(repeating: 0, count: diff.count)
        res[0] = diff[0]
        for i in 1..<diff.count {
            res[i] = res[i - 1] + diff[i]
        }
        return res
    }
}

