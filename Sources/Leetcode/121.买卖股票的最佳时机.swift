//
//  121.买卖股票的最佳时机.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/8.
//

import Foundation

extension Solution {
    /*
     给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

     你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

     返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
     */
    func maxProfit(_ prices: [Int]) -> Int {
        var res: Int = 0
        var dp: [Int] = Array(repeating: -1, count: prices.count)
        dp[0] = prices[0]
        for i in 1..<prices.count {
            dp[i] = min(dp[i - 1], prices[i])
            res = max(res, prices[i] - dp[i])
        }
        return res
    }
}
