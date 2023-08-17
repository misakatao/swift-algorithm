//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/17.
//
//  区间加法

import Foundation

extension Solution {
    /*
     假设你有一个长度为 n 的数组，初始情况下所有的数字均为 0，你将会被出给 k 个更新的操作。
     
     其中，每个操作会被表示为一个三元组：[startIndex, endIndex, inc]，你需要将子数组 A[startIndex ... endIndex] （包括 startIndex 和 endIndex）增加 inc。
     
     请你返回 k 次操作后的数组。
     */
    func getModifiedArray(_ length: Int, _ updates: [[Int]]) -> [Int] {
        var diff: [Int] = Array(repeating: 0, count: length)
        for update in updates {
            let i = update[0]
            let j = update[1]
            let val = update[2]
            
            diff[i] += val
            if j + 1 < length {
                diff[j + 1] -= val
            }
        }
        var res: [Int] = Array(repeating: 0, count: length)
        res[0] = diff[0]
        for i in 1..<diff.count {
            res[i] = res[i - 1] + diff[i]
        }
        return res
    }
}

class Difference {
    
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
    func increment(_ i: Int, _ j: Int, _ val: Int) {
        diff[i] += val
        if j + 1 < diff.count {
            diff[j + 1] -= val
        }
    }
    
    /* 返回结果数组 */
    func result() -> [Int] {
        var res: [Int] = Array(repeating: 0, count: diff.count)
        res[0] = diff[0]
        for i in 1..<diff.count {
            res[i] = res[i - 1] + diff[i]
        }
        return res
    }
}
