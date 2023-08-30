//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/24.
//
//  分割数组的最大值

import Foundation

extension Solution {
    /*
     给定一个非负整数数组 nums 和一个整数 m ，你需要将这个数组分成 m 个非空的连续子数组。

     设计一个算法使得这 m 个子数组各自和的最大值最小。
     */
    func splitArray(_ nums: [Int], _ k: Int) -> Int {
        /// - Parameter sum: 和的最大值
        /// - Returns: 分成多少个子数组
        func f(_ sum: Int) -> Int {
            var m = 0
            var j = 0
            while j < nums.count {
                var sum: Int = sum
                while j < nums.count {
                    if nums[j] > sum {
                        break
                    } else {
                        sum -= nums[j]
                    }
                    j += 1
                }
                m += 1
            }
            return m
        }

        var left: Int = nums.max() ?? 0 // 和的最大值最小边界
        var right: Int = nums.reduce(1, +) // 和的最大值最大边界
        while left < right {
            let mid = left + (right - left) / 2
            if f(mid) <= k {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return left
    }
}
