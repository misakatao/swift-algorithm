//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/22.
//
//  打家劫舍 II

import Foundation

extension Solution {
    /*
     你是一个专业的小偷，计划偷窃沿街的房屋，每间房内都藏有一定的现金。这个地方所有的房屋都 围成一圈 ，这意味着第一个房屋和最后一个房屋是紧挨着的。同时，相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警 。
     
     给定一个代表每个房屋存放金额的非负整数数组，计算你 在不触动警报装置的情况下 ，今晚能够偷窃到的最高金额。
     */
    func rob2(_ nums: [Int]) -> Int {
        func robRange( _ start: Int, _ end: Int) -> Int {
            var dp_i_1: Int = 0
            var dp_i_2: Int = 0
            var res: Int = 0
            for i in (start...end).reversed() {
                res = max(dp_i_1, dp_i_2 + nums[i])
                dp_i_2 = dp_i_1
                dp_i_1 = res
            }
            return res
        }
        let len: Int = nums.count
        if len < 2 { return nums.first ?? 0 }
        return max(robRange(0, len - 2), robRange(1, len - 1))
    }
}
