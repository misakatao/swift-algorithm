//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/18.
//
//  旋转图像

import Foundation

extension Solution {
    /*
     给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。

     你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
     */
    func rotate(_ matrix: inout [[Int]]) {
        let len = matrix.count

//        // 水平翻转
//        for i in 0..<len / 2 {
//            let tmp = matrix[i]
//            matrix[i] = matrix[len - i - 1]
//            matrix[len - i - 1] = tmp
//        }
//        // 对角线翻转
//        for i in 0..<len {
//            for j in i..<len {
//                let tmp = matrix[i][j]
//                matrix[i][j] = matrix[j][i]
//                matrix[j][i] = tmp
//            }
//        }

        // 先沿对角线镜像对称二维矩阵
        for i in 0 ..< len {
            for j in i ..< len {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = tmp
            }
        }
        // 然后反转二维矩阵的每一行
        for i in 0 ..< len {
            var left = 0
            var right: Int = matrix[i].count - 1
            while left < right {
                let tmp = matrix[i][left]
                matrix[i][left] = matrix[i][right]
                left += 1
                matrix[i][right] = tmp
                right -= 1
            }
        }
    }
}
