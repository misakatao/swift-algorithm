//
//  1281.整数的各位积和之差.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/9.
//

import Foundation

extension Solution {
    /*
     给你一个整数 n，请你帮忙计算并返回该整数「各位数字之积」与「各位数字之和」的差。
     */
    func subtractProductAndSum(_ n: Int) -> Int {
        var multiply: Int = 1
        var add: Int = 0
        
        var num: Int = n
        while num != 0 {
            let d = num % 10
            
            multiply *= d
            add += d
            
            num /= 10
        }
        return multiply - add
    }
}
