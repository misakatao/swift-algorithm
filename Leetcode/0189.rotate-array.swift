//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/8.
//
//  轮转数组

import Foundation

extension Solution {
    /*
     给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。
     */
    func rotate(_ nums: inout [Int], _ k: Int) {
        /* 额外数组 */
//        let n = nums.count
//        var plusNums: [Int] = Array(repeating: 0, count: n)
//        for i in 0..<n {
//            plusNums[(n + k) % n] = nums[i]
//        }
//        nums = plusNums

        /* 环状替换 */
//        let k = k % nums.count
//
//        var count: Int = 0
//        var start: Int = 0
//
//        while count < nums.count {
//            var cur = start
//            var pre = nums[start]
//
//            repeat {
//                let next = (cur + k) % nums.count
//
//                let tmp = nums[next]
//                nums[next] = pre
//                pre = tmp
//
//                cur = next
//                count += 1
//            } while start != cur
//
//            start += 1
//        }

        /* 反转法 */
        /*
         零起始: [1 2 3 4 5 [6 7 8 9]]
         第一步: [[9 8 7 6] 5 4 3 2 1]
         第二步: [[9 8 7 6] 1 2 3 4 5]
         第三步: [[6 7 8 9] 1 2 3 4 5]
         */
        func reverse(_ start: Int, _ end: Int) {
            var start = start
            var end = end
            while start < end {
                nums.swapAt(start, end)
                start += 1
                end -= 1
            }
        }
        let k = k % nums.count
        reverse(0, nums.count - 1)
        reverse(k, nums.count - 1)
        reverse(0, k - 1)
    }
}
