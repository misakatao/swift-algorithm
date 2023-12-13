//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/8.
//
//  买卖股票的最佳时机 II

import Foundation

extension Solution {
    /*
     给你一个整数数组 prices ，其中 prices[i] 表示某支股票第 i 天的价格。

     在每一天，你可以决定是否购买和/或出售股票。你在任何时候 最多 只能持有 一股 股票。你也可以先购买，然后在 同一天 出售。

     返回 你能获得的 最大 利润 。
     */
    func maxProfit2(_ prices: [Int]) -> Int {
        let count = prices.count
        /*
         i: 天数
         k: 最大交易次数
         [0,1]: 卖出、买入、持有
         var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: count), count: count)
         dp[i][k][0] = max(dp[i - 1][k][0], dp[i - 1][k][1] + prices[i])
         dp[i][k][1] = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - prices[i])

         k == Int.max
                     = max(dp[i - 1][k][1], dp[i - 1][k][0] - prices[i])
         */
//        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: count)
//        for i in 0..<count {
//            if i - 1 < 0 {
//                dp[i][0] = 0
//                dp[i][1] = -prices[i]
//                continue
//            }
//            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
//            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
//        }
//        return dp[count - 1][0]

        var dp_i_0 = 0
        var dp_i_1 = Int.min
        for i in 0 ..< count {
            let tmp = dp_i_0
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
            dp_i_1 = max(dp_i_1, tmp - prices[i])
        }
        return dp_i_0
    }
}
