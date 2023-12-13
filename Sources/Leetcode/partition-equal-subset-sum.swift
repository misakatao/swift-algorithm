//
//  partition-equal-subset-sum.swift
//  
//
//  Created by Misaka on 2023/12/12.
//

/**
 416. 分割等和子集
 
 给你一个 只包含正整数 的 非空 数组 nums 。请你判断是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。
 */

import Utils

@main
class Solution {
    
    func canPartition(_ nums: [Int]) -> Bool {
        
        var sum = nums.reduce(0, +)
        if sum % 2 != 0 {
            return false
        }
        
        let n = nums.count
        sum = sum / 2
        
        var dp: [Bool] = Array(repeating: Bool(), count: sum + 1)
        dp[0] = true
        
        for i in 0 ..< n {
            if nums[i] > sum {
                continue
            }
            for j in stride(from: sum, through: nums[i], by: -1) {
                if dp[sum] {
                    return true
                }
                dp[j] = dp[j] || dp[j - nums[i]]
            }
        }
        
        return dp[sum]
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.canPartition([1,5,11,5]))")
        }
        printTime {
            print("示例2: \(s.canPartition([1,2,3,5]))")
        }
    }
}
