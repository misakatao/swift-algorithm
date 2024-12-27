//
//  container-with-most-water.swift
//
//
//  Created by Misaka on 2023/8/11.
//

/**
 盛最多水的容器
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。

     找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

     返回容器可以储存的最大水量。

     说明：你不能倾斜容器。
     */
    func maxArea(_ height: [Int]) -> Int {
        let count: Int = height.count

        var res = 0
        var left = 0
        var right: Int = count - 1
        while left < right {
            let w = right - left
            if height[left] > height[right] {
                res = max(res, w * height[right])
                right -= 1
            } else {
                res = max(res, w * height[left])
                left += 1
            }
        }
        return res
    }
    
    static func main() {
        
    }
}
