//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/16.
//
//  区域和检索 - 数组不可变

import Foundation

class NumArray {
    /*
     给定一个整数数组  nums，处理以下类型的多个查询:
     
     计算索引 left 和 right （包含 left 和 right）之间的 nums 元素的 和 ，其中 left <= right
     实现 NumArray 类：
     
     NumArray(int[] nums) 使用数组 nums 初始化对象
     int sumRange(int i, int j) 返回数组 nums 中索引 left 和 right 之间的元素的 总和 ，包含 left 和 right 两点（也就是 nums[left] + nums[left + 1] + ... + nums[right] )
     */
    var preSum: [Int]
    
    init(_ nums: [Int]) {
        preSum = Array(repeating: 0, count: nums.count + 1)
        for i in 1..<preSum.count {
            preSum[i] = preSum[i - 1] + nums[i - 1]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return preSum[right + 1] - preSum[left]
    }
}
