//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/8.
//
//  合并两个有序数组

import Foundation

extension Solution {
    /*
     给你两个按 非递减顺序 排列的整数数组 nums1 和 nums2，另有两个整数 m 和 n ，分别表示 nums1 和 nums2 中的元素数目。

     请你 合并 nums2 到 nums1 中，使合并后的数组同样按 非递减顺序 排列。

     注意：最终，合并后数组不应由函数返回，而是存储在数组 nums1 中。为了应对这种情况，nums1 的初始长度为 m + n，其中前 m 个元素表示应合并的元素，后 n 个元素为 0 ，应忽略。nums2 的长度为 n 。
     */
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        var i: Int = m - 1
        var j: Int = n - 1
        var p: Int = m + n - 1
        
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[p] = nums1[i]
                i -= 1
            } else {
                nums1[p] = nums2[j]
                j -= 1
            }
            p -= 1
        }
        while j >= 0 {
            nums1[p] = nums2[j]
            j -= 1
            p -= 1
        }
    }
}
