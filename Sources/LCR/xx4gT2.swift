//
//  xx4gT2.swift
//
//
//  Created by Misaka on 2023/12/13.
//

/**
 LCR 076. 数组中的第 K 个最大元素
 
 给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。

 请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
 */

import Utils

@main
class Solution {
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        return 0
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.findKthLargest([3,2,1,5,6,4], 2))")
        }
        printTime {
            print("示例2: \(s.findKthLargest([3,2,3,1,2,4,5,5,6], 4))")
        }
    }
}
