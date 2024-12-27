//
//  advantage-shuffle.swift
//
//
//  Created by Misaka on 2023/8/24.
//

/**
 优势洗牌
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给定两个长度相等的数组 nums1 和 nums2，nums1 相对于 nums2 的优势可以用满足 nums1[i] > nums2[i] 的索引 i 的数目来描述。

     返回 nums1 的任意排列，使其相对于 nums2 的优势最大化。
     */
    func advantageCount(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let n: Int = nums1.count
        var idxs: [(Int, Int)] = []
        for i in 0 ..< nums2.count {
            idxs.append((i, nums2[i]))
        }
        idxs.sort { $0.1 < $1.1 }
        var res: [Int] = Array(repeating: 0, count: n)
        var left = 0
        var right: Int = n - 1
        let sorts = nums1.sorted()
        for num in sorts {
            if num > idxs[left].1 {
                res[idxs[left].0] = num
                left += 1
            } else {
                res[idxs[right].0] = num
                right -= 1
            }
        }
        return res
    }
    
    static func main() {
        
    }
}
