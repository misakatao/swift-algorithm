//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/17.
//
//  二维区域和检索 - 矩阵不可变

import Foundation

class NumMatrix {
    /*
     给定一个二维矩阵 matrix，以下类型的多个请求：

     计算其子矩形范围内元素的总和，该子矩阵的 左上角 为 (row1, col1) ，右下角 为 (row2, col2) 。
     实现 NumMatrix 类：

     NumMatrix(int[][] matrix) 给定整数矩阵 matrix 进行初始化
     int sumRegion(int row1, int col1, int row2, int col2) 返回 左上角 (row1, col1) 、右下角 (row2, col2) 所描述的子矩阵的元素 总和 。
     */

    var matrix: [[Int]]
    var preSum: [[Int]]

    init(_ matrix: [[Int]]) {
        self.matrix = matrix
        let rows: Int = matrix.count
        let cols: Int = matrix.first?.count ?? 0

        preSum = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)
        for i in 1 ..< (rows + 1) {
            for j in 1 ..< (cols + 1) {
                preSum[i][j] = preSum[i - 1][j] + preSum[i][j - 1] + matrix[i - 1][j - 1] - preSum[i - 1][j - 1]
            }
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return preSum[row2 + 1][col2 + 2] - preSum[row1][col2 + 1] - preSum[row2 + 1][col1] + preSum[row1][col1]
    }
}
