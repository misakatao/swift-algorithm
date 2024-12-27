//
//  product-of-array-except-self.swift
//
//
//  Created by Misaka on 2024/12/24.
//

/**
 238. 除自身以外数组的乘积
 */

import Foundation
import Utils

@main
class Solution {
    /**
     给你一个整数数组 nums，返回 数组 answer ，其中 answer[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积 。
     
     题目数据 保证 数组 nums之中任意元素的全部前缀元素和后缀的乘积都在  32 位 整数范围内。
     
     请 不要使用除法，且在 O(n) 时间复杂度内完成此题。
     */
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let count = nums.count
        var res: [Int] = Array(repeating: 1, count: count)
        var lproduct = 1
        var rproduct = 1
        var i = 0
        var j = count - 1
        while i < count && j >= 0 {
            res[i] *= lproduct
            res[j] *= rproduct
            
            lproduct *= nums[i]
            rproduct *= nums[j]
            
            i += 1
            j -= 1
        }
        return res
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.productExceptSelf([1,2,3,4]))")
        }
        printTime {
            print("示例2: \(s.productExceptSelf([-1,1,0,-3,3]))")
        }
    }
}
