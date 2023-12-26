//
//  minimum-jumps-to-reach-home.swift
//
//
//  Created by Misaka on 2023/8/30.
//

/**
 1654.到家的最少跳跃次数
 
 有一只跳蚤的家在数轴上的位置 x 处。请你帮助它从位置 0 出发，到达它的家。

 跳蚤跳跃的规则如下：

 它可以 往前 跳恰好 a 个位置（即往右跳）。
 它可以 往后 跳恰好 b 个位置（即往左跳）。
 它不能 连续 往后跳 2 次。
 它不能跳到任何 forbidden 数组中的位置。
 跳蚤可以往前跳 超过 它的家的位置，但是它 不能跳到负整数 的位置。

 给你一个整数数组 forbidden ，其中 forbidden[i] 是跳蚤不能跳到的位置，同时给你整数 a， b 和 x ，请你返回跳蚤到家的最少跳跃次数。如果没有恰好到达 x 的可行方案，请你返回 -1 。
 */

import Foundation
import Utils

@main
class Solution {
    
    func minimumJumps(_ forbidden: [Int], _ a: Int, _ b: Int, _ x: Int) -> Int {
        let s = Set(forbidden)
        let n = 6000 // 定义常量 n，表示可能的最大位置
        
        var queue: [(Int, Int)] = [] // 创建一个队列，用来存储当前位置和跳跃方向，初始状态为在位置 0，方向为 1 正向
        queue.append((0, 1))
        
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 2), count: n) // 创建一个二维数组 visited，用来标记每个位置是否被访问过
        visited[0][1] = true // 初始状态下，位置 0 是被访问过的
        
        var res = 0
        while !queue.isEmpty { // 循环遍历队列，直到队列为空，即找到了到达目标位置的最小跳跃次数
            let sz = queue.count
            for _ in 0 ..< sz { // 循环遍历当前队列中的所有位置
                let (position, direction) = queue.removeFirst() // 取出队首的位置作为当前位置
                if position == x { // 如果当前位置等于目标位置，直接返回当前跳跃次数
                    return res
                }
                
                var next: [(Int, Int)] = [(position + a, 1)] // 创建一个临时数组，用来存储下一个可能的位置和跳跃方向，初始状态下为正向跳跃
                if direction == 1 { // 如果当前跳跃方向是正向跳跃
                    next.append((position - b, 0)) // 添加一个反向跳跃的位置和方向
                }
                
                for (p, d) in next { // 遍历临时数组，依次处理每个位置和方向
                    if p >= 0 && p < n && !s.contains(p) && !visited[p][d] { // 如果位置 p 合法，且未被禁止跳跃，且未被访问过
                        queue.append((p, d)) // 将该位置添加到队列中
                        visited[p][d] = true // 将该位置标记为已访问
                    }
                }
            }
            res += 1
        }
        return -1
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.minimumJumps([14, 4, 18, 1, 15], 3, 15, 9))")
        }
        printTime {
            print("示例2: \(s.minimumJumps([8, 3, 16, 6, 12, 20], 15, 13, 11))")
        }
        printTime {
            print("示例3: \(s.minimumJumps([1, 6, 2, 14, 5, 17, 4], 16, 9, 7))")
        }
    }
}
