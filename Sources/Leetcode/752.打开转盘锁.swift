//
//  752.打开转盘锁.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/8.
//

import Foundation

extension Solution {
    /*
     你有一个带有四个圆形拨轮的转盘锁。每个拨轮都有10个数字： '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' 。每个拨轮可以自由旋转：例如把 '9' 变为 '0'，'0' 变为 '9' 。每次旋转都只能旋转一个拨轮的一位数字。

     锁的初始数字为 '0000' ，一个代表四个拨轮的数字的字符串。

     列表 deadends 包含了一组死亡数字，一旦拨轮的数字和列表里的任何一个元素相同，这个锁将会被永久锁定，无法再被旋转。

     字符串 target 代表可以解锁的数字，你需要给出解锁需要的最小旋转次数，如果无论如何不能解锁，返回 -1 。
     */
    func openLock(_ deadends: [String], _ target: String) -> Int {
        var res: Int = 0
        let deads: Set<String> = Set(deadends)
        var visited: Set<String> = []
        
//        var queue: [String] = []
//        queue.append("0000")
//
//        while !queue.isEmpty {
//            for _ in 0..<queue.count {
//                let cur = queue.removeFirst()
//
//                if deads.contains(cur) {
//                    continue
//                }
//
//                if cur == target {
//                    return res
//                }
//
//                for j in 0..<4 {
//                    for k in [-1, 1] {
//                        var digits = Array<Character>(cur)
//
//                        var newDigit = Int(String(digits[j]))!
//                        newDigit += k
//                        if newDigit == -1 {
//                            newDigit = 9
//                        } else if newDigit == 10 {
//                            newDigit = 0
//                        }
//                        digits[j] = Character(String(newDigit))
//
//                        let lock = String(digits)
//                        if !visited.contains(lock) {
//                            queue.append(lock)
//                            visited.insert(lock)
//                        }
//                    }
//                }
//            }
//            res += 1
//        }
        
        var queue1: Set<String> = []
        var queue2: Set<String> = []
        
        queue1.insert("0000")
        queue2.insert(target)
        
        while !queue1.isEmpty && !queue2.isEmpty {
            var temp: Set<String> = []
            for i in queue1 {
                if deads.contains(i) {
                    continue
                }
                /* 判断是否到达终点 */
                if queue2.contains(i) {
                    return res
                }
                
                visited.insert(i)
                
                /* 将一个节点的未遍历相邻节点加入集合 */
                for j in 0..<4 {
                    for k in [-1, 1] {
                        var digits: [Character] = Array(i)
                        
                        var newDigit = Int(String(digits[j]))!
                        newDigit += k
                        if newDigit == -1 {
                            newDigit = 9
                        } else if newDigit == 10 {
                            newDigit = 0
                        }
                        digits[j] = Character(String(newDigit))
                        
                        let lock = String(digits)
                        if !visited.contains(lock) {
                            temp.insert(lock)
                        }
                    }
                }
            }
            
            res += 1
            queue1 = queue2
            queue2 = temp
        }
        
        return -1
    }
}
