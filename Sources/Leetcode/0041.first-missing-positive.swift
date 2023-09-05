//
//  swift-algorithm
//
//  Created by Misaka on 2023/9/4.
//
//  缺失的第一个正数

import Foundation

extension Solution {
    /*
     给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。
     
     请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。
     */
    func firstMissingPositive(_ nums: [Int]) -> Int {
//        let set: Set<Int> = Set(nums)
//        for i in 1 ... nums.count {
//            if !set.contains(i) {
//                return i
//            }
//        }
//        return nums.count + 1
        
        var nums = nums
        for i in 0 ..< nums.count {
            while nums[i] > 0 && nums[i] <= nums.count && nums[nums[i] - 1] != nums[i] {
                nums.swapAt(nums[i] - 1, i)
            }
        }
        for i in 0 ..< nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
}
