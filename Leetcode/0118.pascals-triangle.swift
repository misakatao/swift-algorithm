//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/22.
//
//  杨辉三角

import Foundation

extension Solution {
    /*
     给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。

     在「杨辉三角」中，每个数是它左上方和右上方的数的和。
     */
    func generate(_ numRows: Int) -> [[Int]] {
        var res: [[Int]] = Array(repeating: [Int](), count: numRows)
        for i in 0 ..< numRows {
            res[i] = Array(repeating: 1, count: i + 1)
        }
        if numRows < 2 { return res }

        for i in 2 ..< numRows {
            for j in 1 ..< i {
                res[i][j] = res[i - 1][j - 1] + res[i - 1][j]
            }
        }
        return res
    }
}
