//
//  binary-search.swift
//
//
//  Created by Misaka on 2023/8/10.
//

/**
 704. 二分查找
 
 给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。
 */

import Foundation
import Utils

@main
class Solution {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right: Int = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
        }
        return -1
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.search([-1,0,3,5,9,12], 9))")
        }
        printTime {
            print("示例2: \(s.search([-1,0,3,5,9,12], 2))")
        }
    }
}
