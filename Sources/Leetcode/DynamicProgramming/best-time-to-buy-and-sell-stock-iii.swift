//
//  best-time-to-buy-and-sell-stock-iii.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 123.买卖股票的最佳时机 III
 
 给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你最多可以完成 两笔 交易。

 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 */

import Foundation
import Utils

@main
class Solution {
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
