//
//  minimize-maximum-of-array.swift
//
//
//  Created by Misaka on 2023/9/7.
//

/**
 最小化数组中的最大值
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个下标从 0 开始的数组 nums ，它含有 n 个非负整数。
     
     每一步操作中，你需要：
     
     选择一个满足 1 <= i < n 的整数 i ，且 nums[i] > 0 。
     将 nums[i] 减 1 。
     将 nums[i - 1] 加 1 。
     你可以对数组执行 任意 次上述操作，请你返回可以得到的 nums 数组中 最大值 最小 为多少。
     */
    func minimizeArrayValue(_ nums: [Int]) -> Int {
        var left = 0
        var right = Int(1e9)
        let f: ((Int) -> Bool) = { x in
            var have = 0
            for n in nums {
                if n <= x {
                    have += x - n
                } else {
                    if have < n - x {
                        return false
                    } else {
                        have -= (n - x)
                    }
                }
            }
            return true
        }
        while left < right {
            let mid = left + (right - left) / 2
            if f(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    static func main() {
        
    }
}
