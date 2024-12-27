//
//  candy.swift
//  
//
//  Created by Misaka on 2024/12/27.
//


/**
 135. 分发糖果
 */

import Foundation
import Utils

@main
class Solution {
    /**
     n 个孩子站成一排。给你一个整数数组 ratings 表示每个孩子的评分。

     你需要按照以下要求，给这些孩子分发糖果：

     每个孩子至少分配到 1 个糖果。
     相邻两个孩子评分更高的孩子会获得更多的糖果。
     请你给每个孩子分发糖果，计算并返回需要准备的 最少糖果数目 。
     */
    func candy(_ ratings: [Int]) -> Int {
        
        return 0
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.candy([1,0,2]))")
        }
        printTime {
            print("示例2: \(s.candy([1,2,2]))")
        }
    }
}
