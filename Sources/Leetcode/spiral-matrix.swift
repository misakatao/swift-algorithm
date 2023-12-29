//
//  spiral-matrix.swift
//
//
//  Created by Misaka on 2023/8/18.
//

/**
 螺旋矩阵
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。
     */
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let rows: Int = matrix.count // m 行
        let cols: Int = matrix.first?.count ?? 1 // n 列

        var leftBound = 0
        var rightBound: Int = cols - 1
        var upperBound = 0
        var lowerBound: Int = rows - 1

        var res: [Int] = []
        while res.count < rows * cols {
            if upperBound <= lowerBound {
                // 在顶部，从左向右
                for j in leftBound ..< rightBound + 1 {
                    res.append(matrix[upperBound][j])
                }
                // 上边界下移
                upperBound += 1
            }
            if leftBound <= rightBound {
                // 在右侧，从上向下
                for i in upperBound ..< lowerBound + 1 {
                    res.append(matrix[i][rightBound])
                }
                // 右边界左移
                rightBound -= 1
            }
            if upperBound <= lowerBound {
                // 在底部，从右向左
                for j in (leftBound ..< rightBound + 1).reversed() {
                    res.append(matrix[lowerBound][j])
                }
                // 下边界上移
                lowerBound -= 1
            }
            if leftBound <= rightBound {
                // 在左侧，从下向上
                for i in (upperBound ..< lowerBound + 1).reversed() {
                    res.append(matrix[i][leftBound])
                }
                // 左边界右移
                leftBound += 1
            }
        }
        return res
    }
}
