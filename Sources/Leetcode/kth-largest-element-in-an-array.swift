//
//  kth-largest-element-in-an-array.swift
//
//
//  Created by Misaka on 2023/12/13.
//

/**
 215. 数组中的第K个最大元素
 
 给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。

 请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

 你必须设计并实现时间复杂度为 O(n) 的算法解决此问题。
 */

import Utils

@main
class Solution {
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        func sort(_ nums: inout [Int], _ lo: Int, _ hi: Int, _ k: Int) -> Int {
            if lo == hi {
                return nums[k]
            }
            let x = nums[lo]
            var i = lo - 1
            var j = hi + 1
            while i < j {
                repeat { i += 1 } while nums[i] < x
                repeat { j -= 1 } while nums[j] > x
                if i < j {
                    nums.swapAt(i, j)
                }
            }
            if k <= j {
                return sort(&nums, lo, j, k)
            } else {
                return sort(&nums, j + 1, hi, k)
            }
        }
        var nums = nums
        return sort(&nums, 0, nums.count - 1, nums.count - k)
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.findKthLargest([3,2,1,5,6,4], 2))")
        }
        printTime {
            print("示例2: \(s.findKthLargest([3,2,3,1,2,4,5,5,6], 4))")
        }
        
        let y: Int8 = 100 &+ 121
        print(y)
    }
}
