//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/24.
//
//  统计参与通信的服务器

import Foundation

extension Solution {
    /*
     这里有一幅服务器分布图，服务器的位置标识在 m * n 的整数矩阵网格 grid 中，1 表示单元格上有服务器，0 表示没有。

     如果两台服务器位于同一行或者同一列，我们就认为它们之间可以进行通信。

     请你统计并返回能够与至少一台其他服务器进行通信的服务器的数量。
     */
    func countServers(_ grid: [[Int]]) -> Int {
        let rows: Int = grid.count
        let cols: Int = grid.first?.count ?? 1
        var rowServers: [Int: Int] = [:]
        var colServers: [Int: Int] = [:]
        for i in 0 ..< rows {
            for j in 0 ..< cols {
                if grid[i][j] == 1 {
                    rowServers[i, default: 0] += 1
                    colServers[j, default: 0] += 1
                }
            }
        }
        var res = 0
        for i in 0 ..< rows {
            for j in 0 ..< cols {
                if grid[i][j] == 1 && (rowServers[i, default: 0] > 1 || colServers[j, default: 0] > 1) {
                    res += 1
                }
            }
        }
        return res
    }
}
