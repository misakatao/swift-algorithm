//
//  insert-interval.swift
//
//
//  Created by Misaka on 2023/8/28.
//

/**
 插入区间
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个 无重叠的 ，按照区间起始端点排序的区间列表。

     在列表中插入一个新的区间，你需要确保列表中的区间仍然有序且不重叠（如果有必要的话，可以合并区间）。
     */
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.isEmpty {
            if newInterval.isEmpty {
                return []
            } else {
                return [newInterval]
            }
        }
        var res: [[Int]] = []
        var i = 0
        while i < intervals.count, intervals[i][1] < newInterval[0] {
            res.append(intervals[i])
            i += 1
        }
        var newInterval = newInterval
        while i < intervals.count, intervals[i][0] <= newInterval[1] {
            newInterval[0] = min(newInterval[0], intervals[i][0])
            newInterval[1] = max(newInterval[1], intervals[i][1])
            i += 1
        }
        res.append(newInterval)
        while i < intervals.count {
            res.append(intervals[i])
            i += 1
        }
        return res
    }
}
