//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/10.
//
//  二分查找

import Foundation

extension Solution {
    /*
     给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。
     */
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        var left: Int = 0
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
}
