//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/22.
//
//  有效的括号

import Foundation

extension Solution {
    /*
     给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
     
     有效字符串需满足：
     
     左括号必须用相同类型的右括号闭合。
     左括号必须以正确的顺序闭合。
     每个右括号都有一个对应的相同类型的左括号。
     */
    func isValid(_ s: String) -> Bool {
//        let chs: [Character] = Array(s)
//        var stack: [Character] = []
//        for ch in chs {
//            if ch == "(" || ch == "[" || ch == "{" {
//                stack.append(ch)
//            } else {
//                if !stack.isEmpty && (stack.last == "(" && ch == ")") || (stack.last == "[" && ch == "]") || (stack.last == "{" && ch == "}") {
//                    stack.removeLast()
//                } else {
//                    return false
//                }
//            }
//        }
//        return stack.isEmpty
        var stack = [Character]()
        let pairs: [Character: Character] = [")": "(", "}": "{", "]": "["]
        for char in s {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else if char == ")" || char == "}" || char == "]" {
                if stack.isEmpty {
                    return false
                }
                
                let topChar = stack.removeLast()
                if topChar != pairs[char] {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
