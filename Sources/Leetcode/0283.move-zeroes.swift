//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/10.
//
//  移动零

import Foundation

extension Solution {
    /*
     给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

     请注意 ，必须在不复制数组的情况下原地对数组进行操作。
     */
    func moveZeroes(_ nums: inout [Int]) {
        if nums.isEmpty { return }

        var fast = 0
        var slow = 0

        while fast < nums.count {
            if nums[fast] != 0 {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }

        for i in slow ..< nums.count {
            nums[i] = 0
        }
    }
}
