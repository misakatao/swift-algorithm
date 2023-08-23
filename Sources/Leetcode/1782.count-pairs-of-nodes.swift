//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/23.
//
//  统计点对的数目

import Foundation

extension Solution {
    /*
     给你一个无向图，无向图由整数 n  ，表示图中节点的数目，和 edges 组成，其中 edges[i] = [ui, vi] 表示 ui 和 vi 之间有一条无向边。同时给你一个代表查询的整数数组 queries 。
     
     第 j 个查询的答案是满足如下条件的点对 (a, b) 的数目：
     
     a < b
     cnt 是与 a 或者 b 相连的边的数目，且 cnt 严格大于 queries[j] 。
     请你返回一个数组 answers ，其中 answers.length == queries.length 且 answers[j] 是第 j 个查询的答案。
     
     请注意，图中可能会有 重复边 。
     */
    func countPairs(_ n: Int, _ edges: [[Int]], _ queries: [Int]) -> [Int] {
        // TODO: something
        return []
    }
}
