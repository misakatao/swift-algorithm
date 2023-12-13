//
//  two-sum-ii-input-array-is-sorted.swift
//
//
//  Created by Misaka on 2023/8/7.
//

/**
 167. 两数之和 II - 输入有序数组
 
 给你一个下标从 1 开始的整数数组 numbers ，该数组已按 非递减顺序排列  ，请你从数组中找出满足相加之和等于目标数 target 的两个数。如果设这两个数分别是 numbers[index1] 和 numbers[index2] ，则 1 <= index1 < index2 <= numbers.length 。

 以长度为 2 的整数数组 [index1, index2] 的形式返回这两个整数的下标 index1 和 index2。

 你可以假设每个输入 只对应唯一的答案 ，而且你 不可以 重复使用相同的元素。

 你所设计的解决方案必须只使用常量级的额外空间。
 */

import Foundation
import Utils

@main
class Solution {
    
    func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right: Int = numbers.count - 1

        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1]
            } else if sum < target {
                left += 1
            } else if sum > target {
                right -= 1
            }
        }
        return [0]
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.twoSum2([2,7,11,15], 9))")
        }
        printTime {
            print("示例2: \(s.twoSum2([2,3,4], 6))")
        }
        printTime {
            print("示例3: \(s.twoSum2([-1,0], -1))")
        }
    }
}
