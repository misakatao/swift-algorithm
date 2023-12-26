//
//  n-queens.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 51. N 皇后

 按照国际象棋的规则，皇后可以攻击与之处在同一行或同一列或同一斜线上的棋子。

 n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。

 给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。

 每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。
 */

import Foundation
import Utils

@main
class Solution {
    
    func solveNQueens(_ n: Int) -> [[String]] {
        var res: [[String]] = []
        return res
    }
    
    func backtrack(_ board: inout [[String]], _ row: Int, _ res: inout [[String]]) {
        
        if res.count == row {
            res.append(board.map({ $0.joined() }))
            return
        }
        
        var line = board[row]
        for column in 0 ..< line.count {
            if !isValid(board, row, column) {
                break
            }
            line[column] = "Q"
            board[row] = line
            backtrack(&board, row + 1, &res)
            line[column] = "."
            board[row] = line
        }
    }
    
    func isValid(_ board: [[String]], _ row: Int, _ column: Int) -> Bool {
        
        return false
    }
    
    static func main() {
        
    }
}
