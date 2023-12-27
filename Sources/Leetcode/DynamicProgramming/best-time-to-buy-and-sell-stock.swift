//
//  best-time-to-buy-and-sell-stock.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 121.买卖股票的最佳时机
 
 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
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

     k == 1
     dp[i][1][0] = max(dp[i - 1][1][0], dp[i - 1][1][1] + prices[i])
     dp[i][1][1] = max(dp[i - 1][1][1], dp[i - 1][0][0] - prices[i])
                 = max(dp[i - 1][1][1], -prices[i])
     解释：k == 0 的 base case，dp[i - 1][0] = 0
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
