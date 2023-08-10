//
//  main.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/1.
//

import Foundation

class ArraySolution {
    
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
}
