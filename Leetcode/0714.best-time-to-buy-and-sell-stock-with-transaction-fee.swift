//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/11.
//
//  买卖股票的最佳时机含手续费

import Foundation

extension Solution {
    /*
     给定一个整数数组 prices，其中 prices[i]表示第 i 天的股票价格 ；整数 fee 代表了交易股票的手续费用。

     你可以无限次地完成交易，但是你每笔交易都需要付手续费。如果你已经购买了一个股票，在卖出它之前你就不能再继续购买股票了。

     返回获得利润的最大值。

     注意：这里的一笔交易指买入持有并卖出股票的整个过程，每笔交易你只需要为支付一次手续费。
     */
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let count: Int = prices.count
        /*
         i: 天数
         k: 最大交易次数
         [0,1]: 卖出、买入、持有
         var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: count), count: count)
         dp[i][k][0] = max(dp[i - 1][k][0], dp[i - 1][k][1] + prices[i])
         dp[i][k][1] = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - prices[i])

         手续费 free
                     = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - free - prices[i])
         */
//        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: count)
//        for i in 0..<count {
//            if i - 1 < 0 {
//                dp[i][0] = 0
//                dp[i][1] = 0 - prices[i] - fee
//                continue
//            }
//            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
//            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i] - fee)
//        }
//        return dp[count - 1][0]

        var dp_i_0 = 0
        var dp_i_1 = Int.min
        for i in 0 ..< count {
            let tmp = dp_i_0
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
            dp_i_1 = max(dp_i_1, tmp - prices[i] - fee)
        }
        return dp_i_0
    }
}
