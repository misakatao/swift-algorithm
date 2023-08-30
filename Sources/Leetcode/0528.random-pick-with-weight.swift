//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/23.
//
//  按权重随机选择

import Foundation

class RandomPickWeight {
    /*
     给你一个 下标从 0 开始 的正整数数组 w ，其中 w[i] 代表第 i 个下标的权重。

     请你实现一个函数 pickIndex ，它可以 随机地 从范围 [0, w.length - 1] 内（含 0 和 w.length - 1）选出并返回一个下标。选取下标 i 的 概率 为 w[i] / sum(w) 。

     例如，对于 w = [1, 3]，挑选下标 0 的概率为 1 / (1 + 3) = 0.25 （即，25%），而选取下标 1 的概率为 3 / (1 + 3) = 0.75（即，75%）。
     */
    private var preSum: [Int]

    init(_ w: [Int]) {
        preSum = Array(repeating: 0, count: w.count + 1)
        preSum[0] = 0
        for i in 1 ... w.count {
            preSum[i] = preSum[i - 1] + w[i - 1]
        }
    }

    func pickIndex() -> Int {
        let target = Int.random(in: 1 ... preSum[preSum.count - 1])
        return leftBound(preSum, target) - 1
    }

    func leftBound(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 { return -1 }
        var left = 0
        var right: Int = nums.count
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                right = mid
            } else if nums[mid] > target {
                right = mid
            } else if nums[mid] < target {
                left = mid + 1
            }
        }
        return left
    }
}
