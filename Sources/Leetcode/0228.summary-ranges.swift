//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/28.
//
//  汇总区间

import Foundation

extension Solution {
    /*
     给定一个  无重复元素 的 有序 整数数组 nums 。

     返回 恰好覆盖数组中所有数字 的 最小有序 区间范围列表 。也就是说，nums 的每个元素都恰好被某个区间范围所覆盖，并且不存在属于某个范围但不属于 nums 的数字 x 。

     列表中的每个区间范围 [a,b] 应该按如下格式输出：

     "a->b" ，如果 a != b
     "a" ，如果 a == b
     */
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.isEmpty { return [] }
        if nums.count == 1 { return ["\(nums[0])"] }
        var fast = 1
        var slow = 0
        func f(_ x: Int, _ y: Int) -> String {
            return x == y ? "\(nums[x])" : "\(nums[x])->\(nums[y])"
        }
        var res: [String] = []
        while fast < nums.count {
            if nums[fast] - nums[fast - 1] > 1 {
                res.append(f(slow, fast - 1))
                slow = fast
                if fast == (nums.count - 1) {
                    res.append(f(slow, fast))
                }
            } else if fast == (nums.count - 1) {
                res.append(f(slow, fast))
            }
            fast += 1
        }
        return res
    }
}
