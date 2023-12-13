//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/8.
//
//  最大子数组和

import Foundation

extension Solution {
    /*
     给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

     子数组 是数组中的一个连续部分。
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }

//        if nums.count < 2 {
//            return nums[0]
//        }
//        var dp: [Int] = Array(repeating: 0, count: nums.count)
//        dp[0] = nums[0]
//
//        for i in 1..<nums.count {
//            dp[i] = max(dp[i - 1] + nums[i], nums[i])
//        }
//
//        var res: Int = Int.min
//        for i in 0..<nums.count {
//            res = max(res, dp[i])
//        }
//        return res

        var pre = 0
        var res: Int = nums[0]
        for i in 0 ..< nums.count {
            pre = max(pre + nums[i], nums[i])
            res = max(res, pre)
        }
        return res
    }
}
