//
//  34.在排序数组中查找元素的第一个和最后一个位置.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/9.
//

import Foundation

extension Solution {
    /*
     给你一个按照非递减顺序排列的整数数组 nums，和一个目标值 target。请你找出给定目标值在数组中的开始位置和结束位置。

     如果数组中不存在目标值 target，返回 [-1, -1]。

     你必须设计并实现时间复杂度为 O(log n) 的算法解决此问题。
     */
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        func leftBound() -> Int {
            var left: Int = 0
            var right: Int = nums.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] == target {
                    // 锁定左侧边界
                    right = mid - 1
                } else if nums[mid] < target {
                    left = mid + 1
                } else if nums[mid] > target {
                    right = mid - 1
                }
            }
            if left < 0 || left >= nums.count {
                return -1
            }
            return nums[left] == target ? left : -1
        }
        
        func rightBound(_ l: Int) -> Int {
            var left: Int = l
            var right: Int = nums.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if nums[mid] == target {
                    // 锁定右侧边界
                    left = mid + 1
                } else if nums[mid] < target {
                    left = mid + 1
                } else if nums[mid] > target {
                    right = mid - 1
                }
            }
            if right < 0 || right >= nums.count {
                return -1
            }
            return nums[right] == target ? right : -1
        }
        
        let left = leftBound()
        if left == -1 { return [-1, -1] }
        return [left, rightBound(left)]
    }
}
