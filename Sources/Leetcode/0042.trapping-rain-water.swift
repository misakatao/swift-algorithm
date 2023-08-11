//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/10.
//
//  接雨水

import Foundation

extension Solution {
    /*
     给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
     */
    func trap(_ height: [Int]) -> Int {
        let count: Int = height.count
        if count < 3 { return 0 }
        
        var res: Int = 0
        
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: count)
        dp[0][0] = 0
        dp[0][1] = 0
        
        for i in 1..<count - 1 {
            dp[i][0] = max(dp[i - 1][0], height[i])
            dp[i][1] = max(dp[i + 1][1], height[i])
            
            let min = min(dp[i][0], dp[i][1])
            
            print("左: \(dp[i][0]) | \(height[i]) | 右: \(dp[i][1])")
            
            if min > height[i] {
                res += min - height[i]
            }
        }
        
//        var leftMax: [Int] = Array(repeating: 0, count: count)
//        leftMax[0] = height[0]
//
//        var rightMax: [Int] = Array(repeating: 0, count: count)
//        rightMax[count - 1] = height[count - 1]
//
//        for i in 1..<count - 1 {
//            leftMax[i] = max(leftMax[i - 1], height[i - 1])
//        }
//        print(leftMax)
//
//        for i in stride(from: count - 2, through: 0, by: -1) {
//            rightMax[i] = max(rightMax[i + 1], height[i + 1])
//        }
//        print(rightMax)
//
//
//        for i in 1..<count - 1 {
//            let min = min(leftMax[i], rightMax[i])
//            if min > height[i] {
//                res += min - height[i]
//            }
//        }
        return res
    }
}
