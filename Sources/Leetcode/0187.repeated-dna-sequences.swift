//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/23.
//
//  重复的DNA序列

import Foundation

extension Solution {
    /*
     DNA序列 由一系列核苷酸组成，缩写为 'A', 'C', 'G' 和 'T'.。

     例如，"ACGAATTCCG" 是一个 DNA序列 。
     在研究 DNA 时，识别 DNA 中的重复序列非常有用。

     给定一个表示 DNA序列 的字符串 s ，返回所有在 DNA 分子中出现不止一次的 长度为 10 的序列(子字符串)。你可以按 任意顺序 返回答案。
     */
    func findRepeatedDnaSequences(_ s: String) -> [String] {
//        let chars: [Character] = Array(s)
//        if chars.count <= 10 { return [] }
//        var seen: Set<String> = []
//        var res: Set<String> = []
//        for i in 0...(chars.count - 10) {
//            let subs = String(chars[i..<i+10])
//            if seen.contains(subs) {
//                res.insert(subs)
//            } else {
//                seen.insert(subs)
//            }
//        }
//        return Array(res)
        let chars: [Character] = Array(s)
        var nums: [Int] = Array(repeating: -1, count: chars.count)
        for (i, char) in chars.enumerated() {
            switch char {
            case "A": nums[i] = 0
            case "C": nums[i] = 1
            case "G": nums[i] = 2
            case "T": nums[i] = 3
            default: break
            }
        }
        var seen: Set<Int> = []
        var res: Set<String> = []
        let L = 10
        let R = 4
        let RL = Int(pow(Double(R), Double(L - 1)))
        var windowHash = 0
        var left = 0
        var right = 0
        while right < chars.count {
            windowHash = R * windowHash + nums[right]
            right += 1
            while right - left == L {
                if seen.contains(windowHash) {
                    res.insert(String(chars[left ..< right]))
                } else {
                    seen.insert(windowHash)
                }
                windowHash = windowHash - nums[left] * RL
                left += 1
            }
        }
        return Array(res)
    }
}
