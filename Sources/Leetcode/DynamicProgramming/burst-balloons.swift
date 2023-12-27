//
//  burst-balloons.swift
//  
//
//  Created by Misaka on 2023/12/27.
//

/**
 312. 戳气球
 
 有 n 个气球，编号为0 到 n - 1，每个气球上都标有一个数字，这些数字存在数组 nums 中。

 现在要求你戳破所有的气球。戳破第 i 个气球，你可以获得 nums[i - 1] * nums[i] * nums[i + 1] 枚硬币。 这里的 i - 1 和 i + 1 代表和 i 相邻的两个气球的序号。如果 i - 1或 i + 1 超出了数组的边界，那么就当它是一个数字为 1 的气球。

 求所能获得硬币的最大数量。
 */

import Foundation
import Utils

@main
class Solution {
    
    func maxCoins(_ nums: [Int]) -> Int {
        let n = nums.count
        var newNums = [1] + nums + [1]
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 2), count: n + 2)
        for len in 3 ... n + 2 {
            var l = 0
            while l + len - 1 <= n + 1 {
                var r = l + len - 1
                for k in (l + 1) ... (r - 1) {
                    dp[l][r] = max(dp[l][r], dp[l][k] + dp[k][r] + newNums[l] * newNums[k] * newNums[r])
                }
                l += 1
            }
        }
        return dp[0][n + 1]
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.maxCoins([3,1,5,8]))")
        }
        printTime {
            print("示例2: \(s.maxCoins([1,5]))")
        }
    }
}
