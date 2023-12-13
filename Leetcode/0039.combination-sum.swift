//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/7.
//
//  组合总和

import Foundation

extension Solution {
    /*
     给你一个 无重复元素 的整数数组 candidates 和一个目标整数 target ，找出 candidates 中可以使数字和为目标数 target 的 所有 不同组合 ，并以列表形式返回。你可以按 任意顺序 返回这些组合。

     candidates 中的 同一个 数字可以 无限制重复被选取 。如果至少一个数字的被选数量不同，则两种组合是不同的。
     */
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res: [[Int]] = []
        var track: [Int] = []
        var trackSum = 0

        func backtrack(_ index: Int) {
            if trackSum == target {
                res.append(track)
                return
            }
            if trackSum > target {
                return
            }
            for i in index ..< candidates.count {
                track.append(candidates[i])
                trackSum += candidates[i]
                backtrack(i)
                track.removeLast()
                trackSum -= candidates[i]
            }
        }
        backtrack(0)
        return res
    }
}