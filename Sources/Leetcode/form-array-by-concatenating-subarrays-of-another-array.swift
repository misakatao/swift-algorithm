//
//  form-array-by-concatenating-subarrays-of-another-array.swift
//
//
//  Created by Misaka on 2024/9/25.
//

/**
 1764. 通过连接另一个数组的子数组得到一个数组
 */

import Foundation
import Utils

@main
class Solution {
    /**
     给你一个长度为 n 的二维整数数组 groups ，同时给你一个整数数组 nums 。
     
     你是否可以从 nums 中选出 n 个 不相交 的子数组，使得第 i 个子数组与 groups[i] （下标从 0 开始）完全相同，且如果 i > 0 ，那么第 (i-1) 个子数组在 nums 中出现的位置在第 i 个子数组前面。（也就是说，这些子数组在 nums 中出现的顺序需要与 groups 顺序相同）
     
     如果你可以找出这样的 n 个子数组，请你返回 true ，否则返回 false 。
     
     如果不存在下标为 k 的元素 nums[k] 属于不止一个子数组，就称这些子数组是 不相交 的。子数组指的是原数组中连续元素组成的一个序列。
     */
    func canChoose(_ groups: [[Int]], _ nums: [Int]) -> Bool {
//        func check(g: [Int], nums: [Int], k: Int) -> Bool {
//            if (k + g.count) > nums.count {
//                return false
//            }
//            for j in 0 ..< g.count {
//                if g[j] != nums[k + j] {
//                    return false
//                }
//            }
//            return true
//        }
//        
//        var i = 0
//        var k = 0
//        while k < nums.count && i < groups.count {
//            if check(g: groups[i], nums: nums, k: k) {
//                k += groups[i].count
//                i += 1
//            } else {
//                k += 1
//            }
//        }
//        return i == groups.count
        
        var p1 = 0
        var p2: Int
        for g in groups {
            p2 = 0
            while p2 < g.count && p1 < nums.count {
                if nums[p1] == g[p2] {
                    p1 += 1
                    p2 += 1
                } else {
                    p1 -= p2
                    p2 = 0
                }
            }
            if p1 >= nums.count && p2 != g.count {
                return false
            }
        }
        return true
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.canChoose([[1,-1,-1],[3,-2,0]], [1,-1,0,1,-1,-1,3,-2,0]))")
            print("示例2: \(s.canChoose([[10,-2],[1,2,3,4]], [1,2,3,4,10,-2]))")
            print("示例3: \(s.canChoose([[1,2,3],[3,4]], [7,7,1,2,3,4,7,7]))")
        }
    }
}
