//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/18.
//
//  螺旋矩阵 II

import Foundation

extension Solution {
    /*
     给你一个正整数 n ，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的 n x n 正方形矩阵 matrix 。
     */
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

        var leftBound = 0
        var rightBound: Int = n - 1
        var upperBound = 0
        var lowerBound: Int = n - 1

        var num = 1
        while num <= n * n {
            if upperBound <= lowerBound {
                // 在顶部，从左往右
                for i in leftBound ..< rightBound + 1 {
                    matrix[upperBound][i] = num
                    num += 1
                }
                // 收缩上边界
                upperBound += 1
            }
            if leftBound <= rightBound {
                // 在右侧，从上往下
                for i in upperBound ..< lowerBound + 1 {
                    matrix[i][rightBound] = num
                    num += 1
                }
                // 收缩右边界
                rightBound -= 1
            }
            if upperBound <= lowerBound {
                // 在底部，从右往左
                for i in (leftBound ..< rightBound + 1).reversed() {
                    matrix[lowerBound][i] = num
                    num += 1
                }
                // 收缩下边界
                lowerBound -= 1
            }
            if leftBound <= rightBound {
                // 在左侧，从下往上
                for i in (upperBound ..< lowerBound + 1).reversed() {
                    matrix[i][leftBound] = num
                    num += 1
                }
                // 收缩左边界
                leftBound += 1
            }
        }
        return matrix
    }
}
