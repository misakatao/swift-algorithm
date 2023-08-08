//
//  509.斐波那契数.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/4.
//

import Foundation

extension Solution {
    
    typealias Matrix = Array<Array<UInt64>>
    
    func matrixMultiply(_ a: Matrix, _ b: Matrix) -> Matrix {
        let n = a.count
        let m = b[0].count
        let p = b.count
        
        var res = Matrix(repeating: Array(repeating: 0, count: m), count: n)
        
        for i in 0..<n {
            for j in 0..<m {
                for k in 0..<p {
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
        for _ in 2...n {
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
        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    
}
