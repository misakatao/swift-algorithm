//
//  matrix-diagonal-sum.swift
//
//
//  Created by Misaka on 2023/8/11.
//

/**
 矩阵对角线元素的和
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个正方形矩阵 mat，请你返回矩阵对角线元素的和。

     请你返回在矩阵主对角线上的元素和副对角线上且不在主对角线上元素的和。
     */
    func diagonalSum(_ mat: [[Int]]) -> Int {
        if mat.isEmpty { return 0 }

        let count = mat.count
        var res = 0

//        for i in 0..<count {
//            for j in 0..<count {
//                if j == i {
//                    res += mat[i][j]
//                } else if count - 1 - j == i {
//                    res += mat[i][j]
//                } else if count - 1 - i == j {
//                    res += mat[i][j]
//                }
//            }
//        }
//        return res

        for i in 0 ..< count {
            res += mat[i][i] + mat[i][count - 1 - i]
        }
        if count % 2 != 0 {
            let mid = (count - 1) / 2
            res -= mat[mid][mid]
        }
        return res
    }
    
    static func main() {
        let solution = Solution()
        let testCases = [
            [[1,2,3],[4,5,6],[7,8,9]],
            [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]],
            [[5]]
        ]
        
        for mat in testCases {
            printTime {
                print("示例: Output: \(solution.diagonalSum(mat))")
            }
        }
    }
}
