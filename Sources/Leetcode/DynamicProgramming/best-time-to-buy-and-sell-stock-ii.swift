//
//  best-time-to-buy-and-sell-stock-ii.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 122.买卖股票的最佳时机 II
 
 给你一个整数数组 prices ，其中 prices[i] 表示某支股票第 i 天的价格。

 在每一天，你可以决定是否购买和/或出售股票。你在任何时候 最多 只能持有 一股 股票。你也可以先购买，然后在 同一天 出售。

 返回 你能获得的 最大 利润 。
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

     k == Int.max
                 = max(dp[i - 1][k][1], dp[i - 1][k][0] - prices[i])
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
