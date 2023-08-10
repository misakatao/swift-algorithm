//
//  51.N 皇后.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//

import Foundation

extension Solution {
    /*
     按照国际象棋的规则，皇后可以攻击与之处在同一行或同一列或同一斜线上的棋子。

     n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。

     给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。

     每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。
     */
    func solveNQueens(_ n: Int) -> [[String]] {
        var res: [[String]] = []
        var board: [[String]] = Array(repeating: Array(repeating: ".", count: n), count: n)
        
        func isValid(_ board: [[String]], _ row: Int, _ column: Int) -> Bool {
            let n = board.count
            // 检查列是否有冲突
            for i in 0..<n {
                if board[i][column] == "Q" {
                    return false
                }
            }
            
            // 检查右上角是否有冲突
            var i = row - 1
            var j = column + 1
            while i >= 0 && j < n {
                if board[i][j] == "Q" {
                    return false
                }

                i -= 1
                j += 1
            }
            
            // 检查左上角是否有冲突
            i = row - 1
            j = column - 1
            while i >= 0 && j >= 0 {
                if board[i][j] == "Q" {
                    return false
                }
                
                i -= 1
                j -= 1
            }
            return true
        }
        
        func backtrack(_ row: Int) {
            
            if row == board.count {
                // 触发结束条件
                res.append(board.map({ $0.joined() }))
                return
            }
            
            var line = board[row]
            for column in 0..<line.count {
                // 剪枝
                if !isValid(board, row, column) {
                    continue
                }
                // 做选择
                line[column] = "Q"
                board[row] = line
                
                backtrack(row + 1)
                
                // 撤销选择
                line[column] = "."
                board[row] = line
            }
        }
        backtrack(0)
        return res
    }
}
