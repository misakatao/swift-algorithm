//
//  jump-game-ii.swift
//
//
//  Created by Misaka on 2024/9/29.
//

/**
 45. 跳跃游戏 II
 */

import Foundation
import Utils

@main
class Solution {
    /**
     给定一个长度为 n 的 0 索引整数数组 nums。初始位置为 nums[0]。

     每个元素 nums[i] 表示从索引 i 向前跳转的最大长度。换句话说，如果你在 nums[i] 处，你可以跳转到任意 nums[i + j] 处:

     0 <= j <= nums[i]
     i + j < n
     返回到达 nums[n - 1] 的最小跳跃次数。生成的测试用例可以到达 nums[n - 1]。
     */
    func jump(_ nums: [Int]) -> Int {
        var ans = 0
        var end = 0
        var maxPos = 0
        for i in 0 ..< nums.count - 1 {
            maxPos = max(maxPos, i + nums[i])
            print("maxPos = \(maxPos)")
            if end == i {
                end = maxPos
                ans += 1
            }
        }
        return ans
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.jump([2,3,1,1,4]))")
        }
        printTime {
            print("示例2: \(s.jump([2,3,0,1,4]))")
        }
    }
}
