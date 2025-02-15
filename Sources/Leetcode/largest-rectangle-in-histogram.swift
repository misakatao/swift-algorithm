//
//  largest-rectangle-in-histogram.swift
//
//
//  Created by Misaka on 2023/9/15.
//

/**
 柱状图中最大的矩形
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。
     
     求在该柱状图中，能够勾勒出来的矩形的最大面积。
     */
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let n = heights.count
        var lStack: [Int] = Array(repeating: 0, count: n)
        var rStack: [Int] = Array(repeating: 0, count: n)

        lStack[0] = -1
        for i in 1 ..< n {
            var pre = i - 1
            while pre >= 0 && heights[pre] >= heights[i] {
                pre = lStack[pre]
            }
            lStack[i] = pre
        }

        rStack[n - 1] = n
        for i in (0 ..< n - 1).reversed() {
            var next = i + 1
            while next < n && heights[next] >= heights[i] {
                next = rStack[next]
            }
            rStack[i] = next
        }

        var res = 0
        for i in 0 ..< n {
            let sum = heights[i] * (rStack[i] - lStack[i] - 1)
            res = max(res, sum)
        }
        return res
    }
    
    static func main() {
        let solution = Solution()
        printTime {
            print("示例1: \(solution.largestRectangleArea([2,1,5,6,2,3]))")
            // 输出: 10
        }
        
        printTime {
            print("示例2: \(solution.largestRectangleArea([2,4]))")
            // 输出: 4
        }
        
        // 添加更多测试用例
        printTime {
            print("示例3: \(solution.largestRectangleArea([1,1,1,1]))")
            // 输出: 4
        }
        
        printTime {
            print("示例4: \(solution.largestRectangleArea([2,1,2]))")
            // 输出: 3
        }
        
        printTime {
            print("示例5: \(solution.largestRectangleArea([5,4,1,2]))")
            // 输出: 8
        }
    }
}
