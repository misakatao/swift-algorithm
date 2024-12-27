//
//  move-pieces-to-obtain-a-string.swift
//
//
//  Created by Misaka on 2023/8/23.
//

/**
 移动片段得到字符串
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你两个字符串 start 和 target ，长度均为 n 。每个字符串 仅 由字符 'L'、'R' 和 '_' 组成，其中：

     字符 'L' 和 'R' 表示片段，其中片段 'L' 只有在其左侧直接存在一个 空位 时才能向 左 移动，而片段 'R' 只有在其右侧直接存在一个 空位 时才能向 右 移动。
     字符 '_' 表示可以被 任意 'L' 或 'R' 片段占据的空位。
     如果在移动字符串 start 中的片段任意次之后可以得到字符串 target ，返回 true ；否则，返回 false 。
     */
    func canChange(_ start: String, _ target: String) -> Bool {
//        if start == target {
//            return true
//        }
//        if start.replacingOccurrences(of: "_", with: "") != target.replacingOccurrences(of: "_", with: "") {
//            return false
//        }
//        var j: Int = 0
//        let targets: [Character] = Array(target)
//        for (idx, ch) in start.enumerated() {
//            if ch == "_" {
//                continue
//            }
//            while targets[j] == "_" {
//                j += 1
//            }
//            if idx != j && (ch == "L") == (idx < j) {
//                return false
//            }
//            j += 1
//        }

        let len = start.count
        let starts: [Character] = Array(start)
        let targets: [Character] = Array(target)
        var i = 0
        var j = 0
        while i < len && j < len {
            while i < len && starts[i] == "_" { i += 1 }
            while j < len && targets[j] == "_" { j += 1 }

            if i < len && j < len {
                if starts[i] != targets[j] { return false }
                if (starts[i] == "L" && i < j) || (starts[i] == "R" && i > j) {
                    return false
                }
                i += 1
                j += 1
            }
        }
        while i < len {
            if starts[i] != "_" { return false }
            i += 1
        }
        while j < len {
            if targets[j] != "_" { return false }
            j += 1
        }
        return true
    }
    
    static func main() {
        
    }
}
