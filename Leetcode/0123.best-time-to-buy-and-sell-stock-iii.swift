//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/10.
//
//  买卖股票的最佳时机 III

import Foundation

extension Solution {
    /*
     给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。

     设计一个算法来计算你所能获取的最大利润。你最多可以完成 两笔 交易。

     注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
     */
    func maxProfit3(_ prices: [Int]) -> Int {
        let count: Int = prices.count
        /*
         i: 天数
         k: 最大交易次数
         [0,1]: 卖出/持有，买入
         var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: count), count: count)
         dp[i][k][0] = max(dp[i - 1][k][0], dp[i - 1][k][1] + prices[i])
         dp[i][k][1] = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - prices[i])

         k == 2
                     = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - prices[i])
         */
//        let max_k: Int = 2
//        var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: max_k + 1), count: count)
//        for i in 0..<count {
//            for k in stride(from: max_k, through: 1, by: -1) {
//                if i - 1 < 0 {
//                    dp[i][k][0] = 0
//                    dp[i][k][1] = -prices[i]
//                    continue
//                }
//                dp[i][k][0] = max(dp[i - 1][k][0], dp[i - 1][k][1] + prices[i])
//                dp[i][k][1] = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - prices[i])
//            }
//        }
//        return dp[count - 1][max_k][0]

        var dp_i_1_0 = 0
        var dp_i_1_1 = Int.min
        var dp_i_2_0 = 0
        var dp_i_2_1 = Int.min
        for i in 0 ..< count {
            dp_i_2_0 = max(dp_i_2_0, dp_i_2_1 + prices[i])
            dp_i_2_1 = max(dp_i_2_1, dp_i_1_0 - prices[i])

            dp_i_1_0 = max(dp_i_1_0, dp_i_1_1 + prices[i])
            dp_i_1_1 = max(dp_i_1_1, -prices[i])
        }
        return dp_i_2_0
    }
}
