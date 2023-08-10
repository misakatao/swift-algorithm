//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/4.
//
//  零钱兑换

import Foundation

extension Solution {
    /*
     给你一个整数数组 `coins` ，表示不同面额的硬币；以及一个整数 `amount` ，表示总金额。
     计算并返回可以凑成总金额所需的 最少的硬币个数 。如果没有任何一种硬币组合能组成总金额，返回 `-1` 。
     你可以认为每种硬币的数量是无限的。
     
     示例 1：
     输入：`coins = [1, 2, 5], amount = 11`
     输出：`3`
     解释：`11 = 5 + 5 + 1`
     
     示例 2：
     输入：`coins = [2], amount = 3`
     输出：`-1`
     
     示例 3：
     输入：`coins = [1], amount = 0`
     输出：`0`
     
     提示：
     `1 <= coins.length <= 12`
     `1 <= coins[i] <= 231 - 1`
     `0 <= amount <= 104`
     */
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var memo: [Int] = Array(repeating: amount + 1, count: amount + 1)
        memo[0] = 0
        for i in 1...amount {
            for coin in coins {
                if i >= coin {
                    memo[i] = min(memo[i], memo[i - coin] + 1)
                }
            }
        }
        return memo[amount] > amount ? -1 : memo[amount]
    }
}
