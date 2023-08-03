//
//  main.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/1.
//

import Foundation

extension Solution {
    
    // 删除有序数组中的重复项
    func removeDuplicates(_ list: [Int]) -> Int {
        
        var nums: [Int] = list
        if list.isEmpty { return 0 }
        
        var fast: Int = 0
        var slow: Int = 0
        
        while slow < list.count {
            if list[fast] != list[slow] {
                slow += 1
                nums[slow] = nums[fast]
            }
            fast += 1
        }
        return slow + 1
    }
    
    func deleteDuplicates(_ list: [Int]) -> Int {
        
        var nums: [Int] = list
        if list.isEmpty { return 0 }
        
        var left: Int = 0
        var right: Int = list.count
        
        while left < right {
            if nums[left] == nums[right] {
                nums[left] = nums[right]
                left += 1
            } else {
                right -= 1
            }
        }
        return left
    }
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        if nums.isEmpty { return 0 }
        
        var fast: Int = 0
        var slow: Int = 0
        
        while fast < nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        
        return slow
    }
    
    func moveZeroes(_ nums: inout [Int]) {
        
        if nums.isEmpty { return }
        
        var fast: Int = 0
        var slow: Int = 0
        
        while fast < nums.count {
            if nums[fast] != 0 {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        
        for i in slow..<nums.count {
            nums[i] = 0
        }
    }
    
    func binarySearch(_ nums: inout [Int], _ target: Int) -> Int {
        
        if nums.isEmpty { return 0 }
        
        var left: Int = 0
        var right: Int = nums.count - 1
        
        while left < right {
            let mid = (left + right) / 2
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
