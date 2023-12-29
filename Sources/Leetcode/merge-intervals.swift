//
//  merge-intervals.swift
//
//
//  Created by Misaka on 2023/8/28.
//

/**
 合并区间
 */

import Foundation
import Utils

@main
class Solution {
    /*
     以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回 一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。
     */
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty { return [] }
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        var res: [[Int]] = [intervals[0]]
        for i in 1 ..< intervals.count {
            let cur = intervals[i]
            var last = res[res.count - 1]
            if cur[0] <= last[1] {
                last[1] = max(last[1], cur[1])
                res[res.count - 1] = last
            } else {
                res.append(cur)
            }
        }
        return res
    }
}
