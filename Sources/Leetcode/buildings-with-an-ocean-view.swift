//
//  buildings-with-an-ocean-view.swift
//
//
//  Created by Misaka on 2024/9/25.
//

import Foundation
import Utils

@main
class Solution {
    /**
     给你一个整数数组 heights，表示一排从左到右建造的建筑物的高度。建筑物的右边是海洋，如果建筑物可以 直接看到 海洋，则该建筑物能看到海景。形式上，如果一个建筑物右边的所有建筑物都比它矮时，它就能看到海景。
     
     返回能看到海景的建筑物的 下标（下标从 0 开始），返回的下标需要按升序排列。
     */
    func findBuildings(_ heights: [Int]) -> [Int] {
//        var result = [Int]()
//        var maxHeight = 0
//        
//        // 从右到左遍历建筑物
//        for i in stride(from: heights.count - 1, through: 0, by: -1) {
//            if heights[i] > maxHeight {
//                result.append(i)
//                maxHeight = heights[i] // 更新右边的最高建筑物
//            }
//        }
//        
//        // 由于是从右往左遍历的，结果需要反转为升序
//        return result.reversed()
        
        var stack = [Int]() // 单调栈，存储能看到海景的建筑物下标
        
        // 遍历所有建筑物
        for i in 0..<heights.count {
            // 如果当前建筑物高度比栈顶建筑物高，说明栈顶建筑物被遮挡，弹出栈顶
            while !stack.isEmpty && heights[stack.last!] <= heights[i] {
                _ = stack.popLast()
            }
            // 当前建筑物入栈
            stack.append(i)
        }
        
        return stack
    }
    
    static func main() {
        let solution = Solution()
        printTime {
            print("示例1: \(solution.findBuildings([4,2,3,1]))")
        }
        printTime {
            print("示例2: \(solution.findBuildings([4,3,2,1]))")
        }
        printTime {
            print("示例3: \(solution.findBuildings([1,3,2,4]))")
        }
        printTime {
            print("示例4: \(solution.findBuildings([2,2,2,2]))")
        }
        printTime {
            print("示例5: \(solution.findBuildings([1,2,3,4]))")
        }
        printTime {
            print("示例6: \(solution.findBuildings([4,3,2,1,5]))")
        }
        printTime {
            print("示例7: \(solution.findBuildings([1]))")
        }
        printTime {
            print("示例8: \(solution.findBuildings([]))")
        }
    }
}
