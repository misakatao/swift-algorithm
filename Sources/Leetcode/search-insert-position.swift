//
//  search-insert-position.swift
//
//
//  Created by Misaka on 2023/8/7.
//

/**
 搜索插入位置
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

     请必须使用时间复杂度为 O(log n) 的算法。
     */
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
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
        return left
    }
}
