//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/4.
//
//  斐波那契数

import Foundation

extension Solution {
    /*
     斐波那契数 （通常用 F(n) 表示）形成的序列称为 斐波那契数列 。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：

     F(0) = 0，F(1) = 1
     F(n) = F(n - 1) + F(n - 2)，其中 n > 1

     给定 n ，请计算 F(n) 。
     */

    typealias Matrix = [[UInt64]]

    func matrixMultiply(_ a: Matrix, _ b: Matrix) -> Matrix {
        let rowsA = a.count
        let colsA = a[0].count
        let _ = b.count
        let colsB = b[0].count

        var res = Matrix(repeating: Array(repeating: 0, count: colsB), count: rowsA)

        for i in 0 ..< rowsA {
            for j in 0 ..< colsB {
                for k in 0 ..< colsA {
                    res[i][j] += a[i][k] * b[k][j]
                }
            }
        }

        return res
    }

    func matrixPower(_ a: Matrix, _ n: Int) -> Matrix {
        var res = a
        var b = a
        var k = n - 1

        while k > 0 {
            if k % 2 != 0 {
                res = matrixMultiply(res, b)
            }

            b = matrixMultiply(b, b)
            k /= 2
        }

        return res
    }

    func fib(_ n: Int) -> Int {
        if n < 2 { return n }

        let matrix = [[UInt64(1), UInt64(1)], [UInt64(1), UInt64(0)]]
        let resultMatrix = matrixPower(matrix, n - 1)
        return Int(resultMatrix[0][0])
    }

    func fib1(_ n: Int) -> Int {
        if n < 2 { return n }

        var dp_i_1 = 1 // dp[i - 1]
        var dp_i_2 = 0 // dp[i - 2]
        for _ in 2 ... n {
            // dp[i] = dp[i - 1] + dp[i - 2]
            let dp_i = dp_i_1 + dp_i_2
            // 滚动更新
            dp_i_2 = dp_i_1
            dp_i_1 = dp_i
        }
        return dp_i_1
    }

    func fib2(_ n: Int) -> Int {
        if n < 2 { return n }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[1] = 1 // dp[i - 1]
        dp[0] = 0 // dp[i - 2]
        for i in 2 ... n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
}
