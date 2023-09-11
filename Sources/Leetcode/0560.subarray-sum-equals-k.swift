//
//  swift-algorithm
//
//  Created by Misaka on 2023/9/8.
//
//  和为 K 的子数组

import Foundation

extension Solution {
    /*
     给你一个整数数组 nums 和一个整数 k ，请你统计并返回 该数组中和为 k 的连续子数组的个数 。
     
     子数组是数组中元素的连续非空序列。
     */
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var map: [Int: Int] = [:]
        var preSum = 0
        for i in 0 ..< nums.count {
            preSum += nums[i]
            
            if let count = map[preSum - k] {
                res += count
            }
            if map[preSum] == nil {
                map[preSum] = 1
            } else {
                map[preSum]! += 1
            }
        }
        return res
    }
}
