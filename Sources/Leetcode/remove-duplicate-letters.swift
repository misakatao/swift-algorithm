//
//  remove-duplicate-letters.swift
//
//
//  Created by Misaka on 2023/8/24.
//

/**
 去除重复字母
 */

import Foundation
import Utils

@main
class Solution {
    /*
     给你一个字符串 s ，请你去除字符串中重复的字母，使得每个字母只出现一次。需保证 返回结果的字典序最小（要求不能打乱其他字符的相对位置）。
     */
    func removeDuplicateLetters(_ s: String) -> String {
//        var stack: [Character] = [] // 建立一个栈
//        var count: [Character : Int] = [:] // 维护一个计数器记录字符串中字符的数量
//        for ch in Array(s) {
//            count[ch, default: 0] += 1
//        }
//        var inStack: [Character : Bool] = [:] // 维护一个标志器
//        for ch in Array(s) {
//            count[ch]! -= 1 // 每遍历过一个字符，都将对应的计数减一
//            if inStack[ch] == true {
//                // 如果字符 ch 已经在栈中就跳过
//                continue
//            }
//            while let last = stack.last, last > ch, let lastCount = count[last], lastCount > 0 {
//                // 其他情况，与栈顶字符进行比较
//                inStack[last] = false // 栈顶元素弹出后在标志中设为 false
//                _ = stack.popLast()
//            }
//            stack.append(ch)
//            inStack[ch] = true
//        }
//        return String(stack)

        let chars: [Character] = Array(s)
        var counter: [Character: Int] = [:]
        for ch in chars {
            counter[ch, default: 0] += 1
        }
        var inStack: [Character: Bool] = [:]
        var stack: [Character] = []
        for ch in chars {
            counter[ch]! -= 1

            if inStack[ch] == true {
                continue
            }

            while let last = stack.last, last > ch, let lastCount = counter[last], lastCount > 0 {
                inStack[last] = false
                _ = stack.popLast()
            }

            stack.append(ch)
            inStack[ch] = true
        }
        return String(stack)
    }
}
