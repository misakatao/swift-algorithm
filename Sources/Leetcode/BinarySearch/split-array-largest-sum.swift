//
//  split-array-largest-sum.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 410. 分割数组的最大值
 
 给定一个非负整数数组 nums 和一个整数 k ，你需要将这个数组分成 k 个非空的连续子数组。

 设计一个算法使得这 k 个子数组各自和的最大值最小。
 */

import Foundation
import Utils

@main
class Solution {
    
    func splitArray(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var right = 1
        for num in nums {
            left = max(left, num)
            right += num
        }
        while left < right {
            let mid = left + (right - left) / 2
            var sum = 0
            var count = 1
            for num in nums {
                sum += num
                if sum > mid {
                    count += 1
                    sum = num
                }
            }
            if count > k {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.splitArray([7, 2, 5, 10, 8], 2))")
        }
        printTime {
            print("示例2: \(s.splitArray([1, 2, 3, 4, 5], 2))")
        }
        printTime {
            print("示例3: \(s.splitArray([1, 4, 4], 3))")
        }
    }
}
