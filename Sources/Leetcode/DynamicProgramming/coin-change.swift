//
//  coin-change.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 322.零钱兑换
 
 给你一个整数数组 `coins` ，表示不同面额的硬币；以及一个整数 `amount` ，表示总金额。
 计算并返回可以凑成总金额所需的 最少的硬币个数 。如果没有任何一种硬币组合能组成总金额，返回 `-1` 。
 你可以认为每种硬币的数量是无限的。
 */

import Foundation
import Utils

@main
class Solution {
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp: [Int] = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 1 ..< amount + 1 {
            for coin in coins {
                if i >= coin {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.coinChange([1,2,5], 11))")
        }
        printTime {
            print("示例2: \(s.coinChange([2], 3))")
        }
        printTime {
            print("示例3: \(s.coinChange([1], 0))")
        }
        printTime {
            print("示例4: \(s.coinChange([1,2,5,10,50,100], 1680))")
        }
    }
}
