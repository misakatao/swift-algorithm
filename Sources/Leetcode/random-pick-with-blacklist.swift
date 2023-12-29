//
//  random-pick-with-blacklist.swift
//
//
//  Created by Misaka on 2023/8/24.
//

/**
 黑名单中的随机数
 */

import Foundation

class BlackRandomSolution {
    /*
     给定一个整数 n 和一个 无重复 黑名单整数数组 blacklist 。设计一种算法，从 [0, n - 1] 范围内的任意整数中选取一个 未加入 黑名单 blacklist 的整数。任何在上述范围内且不在黑名单 blacklist 中的整数都应该有 同等的可能性 被返回。

     优化你的算法，使它最小化调用语言 内置 随机函数的次数。

     实现 Solution 类:

     Solution(int n, int[] blacklist) 初始化整数 n 和被加入黑名单 blacklist 的整数
     int pick() 返回一个范围为 [0, n - 1] 且不在黑名单 blacklist 中的随机整数
     */

    var sz: Int
    var valToIndex: [Int: Int] = [:]

    init(_ n: Int, _ blacklist: [Int]) {
        sz = n - blacklist.count
        for b in blacklist {
            valToIndex[b] = -1
        }
        print(valToIndex)
        var last = n - 1
        for b in blacklist {
            if b >= sz {
                continue
            }
            while valToIndex[last] != nil {
                last -= 1
            }
            valToIndex[b] = last
            last -= 1
        }
        print(valToIndex)
    }

    func pick() -> Int {
        let index = Int.random(in: 0 ..< sz)
        print("pick: \(index)")
        if let val = valToIndex[index] {
            return val
        }
        return index
    }
}
