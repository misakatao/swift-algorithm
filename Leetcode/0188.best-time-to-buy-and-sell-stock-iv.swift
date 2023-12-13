//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/10.
//
//  买卖股票的最佳时机 IV

import Foundation

extension Solution {
    /*
     给你一个整数数组 prices 和一个整数 k ，其中 prices[i] 是某支给定的股票在第 i 天的价格。

     设计一个算法来计算你所能获取的最大利润。你最多可以完成 k 笔交易。也就是说，你最多可以买 k 次，卖 k 次。

     注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
     */
    func maxProfit4(_ k: Int, _ prices: [Int]) -> Int {
        let count: Int = prices.count
        /*
         i: 天数
         k: 最大交易次数
         [0,1]: 卖出、买入、持有
         var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: count), count: count)
         dp[i][k][0] = max(dp[i - 1][k][0], dp[i - 1][k][1] + prices[i])
         dp[i][k][1] = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - prices[i])
         */
        if k > count / 2 {
            var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: count)
            for i in 0 ..< count {
                if i - 1 < 0 {
                    dp[i][0] = 0
                    dp[i][1] = -prices[i]
                    continue
                }
                dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
                dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
            }
            return dp[count - 1][0]
        }
        var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: k + 1), count: count)

        for i in 0 ..< count {
            dp[i][0][0] = 0
            dp[i][0][1] = Int.min

            for j in stride(from: k, through: 1, by: -1) {
                if i - 1 < 0 {
                    dp[i][j][0] = 0
                    dp[i][j][1] = -prices[i]
                    continue
                }
                dp[i][j][0] = max(dp[i - 1][j][0], dp[i - 1][j][1] + prices[i])
                dp[i][j][1] = max(dp[i - 1][j][1], dp[i - 1][j - 1][0] - prices[i])
            }
        }
        return dp[count - 1][k][0]
    }
}
