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
        let length = ratings.count
        if length <= 1 { return length }
        
        // Use array for simplicity and safety while maintaining good performance
        var candies = Array(repeating: 1, count: length)
        
        // Forward pass - compare with left neighbor
        for index in 1..<length {
            if ratings[index] > ratings[index-1] {
                candies[index] = candies[index-1] + 1
            }
        }
        
        // Backward pass - compare with right neighbor and update running sum
        var totalCandy = candies[length-1]
        
        for index in (0..<length-1).reversed() {
            if ratings[index] > ratings[index+1] {
                candies[index] = max(candies[index], candies[index+1] + 1)
            }
            totalCandy += candies[index]
        }
        
        return totalCandy
    }
    
    static func main() {
        let solution = Solution()
        printTime {
            print("示例1: \(solution.candy([1,0,2]))")  // 输出: 5
        }
        printTime {
            print("示例2: \(solution.candy([1,2,2]))")  // 输出: 4
        }
        printTime {
            print("示例3: \(solution.candy([1,3,2,2,1]))")  // 输出: 7
        }
        printTime {
            print("示例4: \(solution.candy([1,2,87,87,87,2,1]))")  // 输出: 13
        }
        printTime {
            print("示例5: \(solution.candy([1]))")  // 输出: 1
        }
    }
}
