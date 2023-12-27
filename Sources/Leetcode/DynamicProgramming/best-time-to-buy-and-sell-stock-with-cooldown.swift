//
//  best-time-to-buy-and-sell-stock-with-cooldown.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 309.买卖股票的最佳时机含冷冻期
 
 给定一个整数数组prices，其中第  prices[i] 表示第 i 天的股票价格 。

 设计一个算法计算出最大利润。在满足以下约束条件下，你可以尽可能地完成更多的交易（多次买卖一支股票）:

 卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。
 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 */

import Foundation
import Utils

@main
class Solution {
    /*
     i: 天数
     k: 最大交易次数
     [0,1]: 卖出、买入、持有
     var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: count), count: count)
     dp[i][k][0] = max(dp[i - 1][k][0], dp[i - 1][k][1] + prices[i])
     dp[i][k][1] = max(dp[i - 1][k][1], dp[i - 1][k - 1][0] - prices[i])

     冷冻期1天，至少需要隔一天
                 = max(dp[i - 1][k][1], dp[i - 1][k - 2][0] - prices[i])
     */
    func maxProfit(_ prices: [Int]) -> Int {
        
        return 0
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.maxProfit([]))")
        }
    }
}
