//
//  40.组合总和 II.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//

import Foundation

extension Solution {
    /*
     给定一个候选人编号的集合 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

     candidates 中的每个数字在每个组合中只能使用 一次 。

     注意：解集不能包含重复的组合。 
     */
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res: [[Int]] = []
        var track: [Int] = []
        let candidates = candidates.sorted()
        var trackSum: Int = 0
        
        func backtrack(_ index: Int) {
            if trackSum == target {
                res.append(track)
                return
            }
            if trackSum > target {
                return
            }
            for i in index..<candidates.count {
                if i > index && candidates[i] == candidates[i - 1] {
                    continue
                }
                track.append(candidates[i])
                trackSum += candidates[i]
                backtrack(i + 1)
                track.removeLast()
                trackSum -= candidates[i]
            }
        }
        backtrack(0)
        
//        func backtrack(_ index: Int, _ target: Int) {
//            if 0 == target {
//                res.append(track)
//                return
//            }
//            for i in index..<candidates.count {
//                if i > index && candidates[i] == candidates[i - 1] {
//                    continue
//                }
//                if target < candidates[i] {
//                    break
//                }
//                track.append(candidates[i])
//                backtrack(i + 1, target - candidates[i])
//                track.removeLast()
//            }
//        }
//        backtrack(0, target)
        return res
    }
}
