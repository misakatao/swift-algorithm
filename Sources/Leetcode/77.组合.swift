//
//  77.组合.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//

import Foundation

extension Solution {
    /*
     给定两个整数 n 和 k，返回范围 [1, n] 中所有可能的 k 个数的组合。
     
     你可以按 任何顺序 返回答案。
     */
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = Array<Array<Int>>()
        var track = Array<Int>()
        let nums = Array(1...n)
        
        func backtrack(_ index: Int) {
            if track.count == k {
                res.append(track)
                return
            }
            for i in index..<nums.count {
                track.append(nums[i])
                backtrack(i + 1)
                track.removeLast()
            }
        }
        backtrack(0)
        return res
    }
}
