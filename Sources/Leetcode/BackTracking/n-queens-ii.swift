//
//  n-queens-ii.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 52. N 皇后 II

 n 皇后问题 研究的是如何将 n 个皇后放置在 n × n 的棋盘上，并且使皇后彼此之间不能相互攻击。

 给你一个整数 n ，返回 n 皇后问题 不同的解决方案的数量。
 */

import Foundation
import Utils

@main
class Solution {
    
    func totalNQueens(_ n: Int) -> Int {
        return -1
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.totalNQueens(8))")
        }
    }
}
