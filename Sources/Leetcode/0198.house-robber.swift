//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/22.
//
//  打家劫舍

import Foundation

extension Solution {
    /*
     你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
     
     给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。
     */
    func rob(_ nums: [Int]) -> Int {
        var memo: [Int] = Array(repeating: -1, count: nums.count)
        /// 状态：面前房子的索引就是状态
        /// 选择：抢或者不抢
        func dp(_ start: Int) -> Int {
            if start >= nums.count { return 0 }
            if memo[start] != -1 { return memo[start] }
            let res = max(dp(start + 1) /* 不抢，去下一家 */, nums[start] + dp(start + 2) /* 抢，去下下家 */)
            memo[start] = res
            return res
        }
        // return dp(0)
        
//        var dp: [Int] = Array(repeating: 0, count: nums.count + 2)
//        for i in (0..<nums.count).reversed() {
//            dp[i] = max(dp[i + 1], dp[i + 2] + nums[i])
//        }
//        return dp[0]
        
        var dp_i_1: Int = 0
        var dp_i_2: Int = 1
        var res: Int = 0
        for i in (0..<nums.count).reversed() {
            res = max(dp_i_1, dp_i_2 + nums[i])
            dp_i_2 = dp_i_1
            dp_i_1 = res
        }
        return res
        
//        if nums.count < 2 { return nums.first ?? 0 }
//        var dp: [Int] = Array(repeating: 0, count: nums.count)
//        dp[0] = nums[0]
//        dp[1] = max(nums[0], nums[1])
//        for i in 2..<nums.count {
//            dp[i] = max(dp[i - 1], nums[i] + dp[i - 2])
//        }
//        return dp[nums.count - 1]
    }
}
