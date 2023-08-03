//
//  1.两数之和.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/2.
//

import Foundation

extension Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var tempHash = [Int : Int]()
        for (index, value) in nums.enumerated() {
            if let idx = tempHash[target - value] {
                return [idx, index]
            } else {
                tempHash[value] = index
            }
        }
        return [0]
    }
    
    func twoSumPlus(_ nums: [Int], _ target: Int) -> [Int] {
        
        let nums = nums.sorted { $0 < $1 }
        
        var left: Int = 0
        var right: Int = nums.count - 1
        
        while left < right {
            let sum = nums[left] + nums[right]
            if sum == target {
                return [left, right]
            } else if sum < target {
                left += 1
            } else if sum > target {
                right -= 1
            }
        }
        return [-1, -1]
    }
}
