//
//  0327.count-of-range-sum.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/9/1.
//
//  区间和的个数

import Foundation

extension Solution {
    /*
     给你一个整数数组 nums 以及两个整数 lower 和 upper 。求数组中，值位于范围 [lower, upper] （包含 lower 和 upper）之内的 区间和的个数 。
     
     区间和 S(i, j) 表示在 nums 中，位置从 i 到 j 的元素之和，包含 i 和 j (i ≤ j)。
     */
    func countRangeSum(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        let len = nums.count
        var preSum: [Int] = Array(repeating: 0, count: len + 1)
        for i in 0 ..< len {
            preSum[i + 1] = nums[i] + preSum[i]
        }
        var temp: [Int] = Array(repeating: 0, count: preSum.count)
        var res = 0
        func sort(_ lo: Int, _ hi: Int) {
            if lo == hi { return }
            let mid = lo + (hi - lo) / 2
            sort(lo, mid)
            sort(mid + 1, hi)
            
            for i in lo ... hi {
                temp[i] = preSum[i]
            }
            
            var start = mid + 1
            var end = mid + 1
            for i in lo ... mid {
                while start <= hi && preSum[start] - preSum[i] < lower {
                    start += 1
                }
                while end <= hi && preSum[end] - preSum[i] <= upper {
                    end += 1
                }
                res += end - start
            }
            
            var i = lo
            var j = mid + 1
            for p in lo ... hi {
                if i == mid + 1 {
                    preSum[p] = temp[j]
                    j += 1
                } else if j == hi + 1 {
                    preSum[p] = temp[i]
                    i += 1
                } else if temp[i] > temp[j] {
                    preSum[p] = temp[j]
                    j += 1
                } else {
                    preSum[p] = temp[i]
                    i += 1
                }
            }
        }
        sort(0, preSum.count - 1)
        return res
    }
}
