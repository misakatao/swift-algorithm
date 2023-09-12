//
//  swift-algorithm
//
//  Created by Misaka on 2023/9/12.
//
//  数组中的第K个最大元素

import Foundation

extension Solution {
    /*
     给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。
     
     请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
     
     你必须设计并实现时间复杂度为 O(n) 的算法解决此问题。
     */
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
//        var pq = Heap<Int>({ $0 < $1 })
//        for num in nums {
//            pq.offer(num)
//            if pq.count > k {
//                _ = pq.pop()
//            }
//        }
//        return pq.peek() ?? 0
        
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
}
