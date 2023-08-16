//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/16.
//
//  寻找两个正序数组的中位数

import Foundation

extension Solution {
    /*
     给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
     
     算法的时间复杂度应该为 O(log (m+n)) 。
     */
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        func getKthElements(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
            
            var index1: Int = 0
            var index2: Int = 0
            var k = k
            while true {
                if index1 == nums1.count {
                    return nums2[index2 + k - 1]
                }
                if index2 == nums2.count {
                    return nums1[index1 + k - 1]
                }
                if k == 1 {
                    return min(nums1[index1], nums2[index2])
                }
                let newI1 =  min(index1 + k / 2, nums1.count) - 1
                let newI2 =  min(index2 + k / 2, nums2.count) - 1
                if nums1[newI1] > nums2[newI2] {
                    k -= (newI2 - index2 + 1)
                    index2 = newI2 + 1
                } else {
                    k -= (newI1 - index1 + 1)
                    index1 = newI1 + 1
                }
            }
        }
        
        let len = nums1.count + nums2.count
        if len % 2 == 0 {
            let middle = getKthElements(nums1, nums2, len / 2) + getKthElements(nums1, nums2, len / 2 + 1)
            return Double(middle) / 2.0
        } else {
            return Double(getKthElements(nums1, nums2, len / 2 + 1))
        }
        
//        var res: [Int] = []
//
//        var i: Int = 0
//        var j: Int = 0
//
//        while i < nums1.count || j < nums2.count {
//
//            if i >= nums1.count {
//                res.append(nums2[j])
//                j += 1
//                continue
//            }
//
//            if j >= nums2.count {
//                res.append(nums1[i])
//                i += 1
//                continue
//            }
//
//            if nums1[i] > nums2[j] {
//                res.append(nums2[j])
//                j += 1
//            } else {
//                res.append(nums1[i])
//                i += 1
//            }
//        }
//
//        var left: Int = 0
//        let right: Int = res.count / 2
//
//        if res.count % 2 == 0 {
//            left = right - 1
//        } else {
//            left = right
//        }
//
//        return Double(res[left] + res[right]) / 2.0
    }
}
