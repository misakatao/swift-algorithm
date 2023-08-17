//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/17.
//
//  切披萨的方案数

import Foundation

extension Solution {
    /*
     给你一个 rows x cols 大小的矩形披萨和一个整数 k ，矩形包含两种字符： 'A' （表示苹果）和 '.' （表示空白格子）。你需要切披萨 k-1 次，得到 k 块披萨并送给别人。

     切披萨的每一刀，先要选择是向垂直还是水平方向切，再在矩形的边界上选一个切的位置，将披萨一分为二。如果垂直地切披萨，那么需要把左边的部分送给一个人，如果水平地切，那么需要把上面的部分送给一个人。在切完最后一刀后，需要把剩下来的一块送给最后一个人。

     请你返回确保每一块披萨包含 至少 一个苹果的切披萨方案数。由于答案可能是个很大的数字，请你返回它对 10^9 + 7 取余的结果。
     */
    func ways(_ pizza: [String], _ k: Int) -> Int {
        
        let module = Int(1e9 + 7)
        
        let rows: Int = pizza.count
        let cols: Int = pizza[0].count
        
        // sumA[r][c] = pizza[r:,c:] 中的苹果数量。这种方法叫：二维前缀和
        var sumA: [[Int]] = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)
        
        // 记忆化递归 —— 记忆表（3个参数3维）
        var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: -1, count: k), count: cols), count: rows)

        /// dfs
        /// - Parameters:
        ///   - row: 行坐标
        ///   - col: 列坐标
        ///   - remain: 还需要切多少次
        /// - Returns: 多少种切法
        func dfs(_ row: Int, _ col: Int, _ remain: Int) -> Int {
            if dp[row][col][remain] != -1 {
                // 记忆化递归 —— 记录有效，直接查表
                return dp[row][col][remain]
            }
            if remain == 0 {
                //当前子 pizza 含有 apple 时算 1 种。否则无 apple 算 0 种
                dp[row][col][remain] = (sumA[row][col] > 0 ? 1 : 0)
                return dp[row][col][remain]
            }
            var cnt: Int = 0
            // 定义FAR（first apple row）为当前子pizza中从上往下首个包含苹果的行（不存在🍎取inf 无穷大）
            // 定义FAC（first apple col）为当前子pizza中从左往右首个包含苹果的列（如 pizza[5:,5:]的FAR=FAC=inf）
            var nr = row
            var nc = col
            // 要保证 [row, nr) 行且 col 列之右有苹果，跳出循环后 nr == FAR + 1
            while nr < rows && sumA[row][col] == sumA[nr][col] {
                nr += 1
            }
            // 递归 pizza[r:, c:] 切法结果
            for i in nr..<rows { // 切为 [row, nr) 行和 [nr, rows) 行
                cnt = (cnt + dfs(i, col, remain - 1)) % module
            }

            // 要保证 row 行及以下 [col, nc) 列有苹果，跳出循环后 nc == FAC + 1
            while nc < cols && sumA[row][col] == sumA[row][nc] {
                nc += 1
            }
            for j in nc..<cols { // 切为 [col, nc) 列和 [nc, cols) 列
                cnt = (cnt + dfs(row, j, remain - 1)) % module
            }

            // 记忆化递归 —— 记录结果
            dp[row][col][remain] = cnt
            return cnt
        }

        for r in stride(from: rows - 1, through: 0, by: -1) {
            for c in stride(from: cols - 1, through: 0, by: -1) {
                sumA[r][c] = (Array(pizza[r])[c] == "A" ? 1 : 0) + sumA[r + 1][c] + sumA[r][c + 1] - sumA[r + 1][c + 1]
            }
        }
        return dfs(0, 0, k - 1)
    }
    
    func ways2(_ pizza: [String], _ k: Int) -> Int {
        let module = Int(1e9 + 7)
        
        let rows: Int = pizza.count
        let cols: Int = pizza[0].count
        
        var sumA: [[Int]] = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)

        var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1), count: k + 1)
        
        for r in (0..<rows).reversed() {
            for c in (0..<cols).reversed() {
                sumA[r][c] = (Array(pizza[r])[c] == "A" ? 1 : 0) + sumA[r + 1][c] + sumA[r][c + 1] - sumA[r + 1][c + 1]
                dp[1][r][c] = sumA[r][c] > 0 ? 1 : 0
            }
        }
        
        for ki in 2..<(k + 1) {
            for r in 0..<rows {
                for c in 0..<cols {
                    // 水平方向
                    for nr in (r + 1)..<rows {
                        if sumA[r][c] > sumA[nr][c] {
                            dp[ki][r][c] = (dp[ki][r][c] + dp[ki - 1][nr][c]) % module
                        }
                    }
                    // 垂直方向
                    for nc in (c + 1)..<cols {
                        if sumA[r][c] > sumA[r][nc] {
                            dp[ki][r][c] = (dp[ki][r][c] + dp[ki - 1][r][nc]) % module
                        }
                    }
                }
            }
        }
        
        return dp[k][0][0]
    }
    
}
