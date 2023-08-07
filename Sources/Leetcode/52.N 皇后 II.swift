//
//  52.N 皇后 II.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//

import Foundation

extension Solution {
    /*
     n 皇后问题 研究的是如何将 n 个皇后放置在 n × n 的棋盘上，并且使皇后彼此之间不能相互攻击。

     给你一个整数 n ，返回 n 皇后问题 不同的解决方案的数量。
     */
    func totalNQueens(_ n: Int) -> Int {
        var res: Int = 0
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        
        func isValid(_ board: [[String]], _ row: Int, _ column: Int) -> Bool {
            let n = board.count
            for i in 0..<n {
                if board[i][column] == "Q" {
                    return false
                }
            }
            
            var i = row - 1
            var j = column + 1
            while i >= 0 && j < n {
                if board[i][j] == "Q" {
                    return false
                }
                
                i -= 1
                j += 1
            }
            
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
                res += 1
                return
            }
            
            var line = board[row]
            for column in 0..<line.count {
                if !isValid(board, row, column) {
                    continue
                }
                line[column] = "Q"
                board[row] = line
                
                backtrack(row + 1)
                
                line[column] = "."
                board[row] = line
            }
        }
        
        backtrack(0)
        return res
    }
}
