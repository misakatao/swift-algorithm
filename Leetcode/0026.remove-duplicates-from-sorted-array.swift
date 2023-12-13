//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//
//  删除有序数组中的重复项

import Foundation

extension Solution {
    /*
     给你一个 升序排列 的数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。元素的 相对顺序 应该保持 一致 。然后返回 nums 中唯一元素的个数。
     */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty { return 0 }

        var fast = 0
        var slow = 0
        while fast < nums.count {
            if nums[fast] != nums[slow] {
                slow += 1
                nums[slow] = nums[fast]
            }
            fast += 1
        }
        return slow + 1
    }
}
