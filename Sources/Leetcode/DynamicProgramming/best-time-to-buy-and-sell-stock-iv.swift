//
//  best-time-to-buy-and-sell-stock-iv.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 188.买卖股票的最佳时机 IV
 
 给你一个整数数组 prices 和一个整数 k ，其中 prices[i] 是某支给定的股票在第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你最多可以完成 k 笔交易。也就是说，你最多可以买 k 次，卖 k 次。

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
     */
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        
        return 0
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.maxProfit(1, []))")
        }
    }
}
