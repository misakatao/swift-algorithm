//
//  na-ying-bi.swift
//  
//
//  Created by Misaka on 2023/12/25.
//

/**
 LCP 06. 拿硬币
 
 桌上有 n 堆力扣币，每堆的数量保存在数组 coins 中。我们每次可以选择任意一堆，拿走其中的一枚或者两枚，求拿完所有力扣币的最少次数。
 */

import Foundation
import Utils

@main
class Solution {
    
    func minCount(_ coins: [Int]) -> Int {
        coins.reduce(0) { $0 + $1/2 + ($1 % 2 == 0 ? 0 : 1) }
    }
    
    static func main() {
        let s = Solution()
        printTime {
            print("示例1: \(s.minCount([4,2,1]))")
        }
        printTime {
            print("示例2: \(s.minCount([2,3,10]))")
        }
    }
    
    func pathEncryption(_ path: String) -> String {
        var paths: [Character] = Array(path)
        for (i, c) in paths.enumerated() {
            if c == "." {
                paths[i] = " "
            }
        }
        return String(paths)
    }
    
    func dynamicPassword(_ password: String, _ target: Int) -> String {
        if password.count <= target {
            return password
        }
        var chs: [Character] = Array(password)
        var queue: [Character] = []
        for (i, c) in chs.enumerated() {
            if i < target {
                queue.append(c)
                chs.removeFirst()
            } else {
                break
            }
        }
        chs.append(contentsOf: queue)
        return String(chs)
    }
    
    func validNumber(_ s: String) -> Bool {
        let states: [[Character: Int]] = [
            [" ": 0, "s": 1, "d": 2, ".": 4], // 0. start with 'blank'
            ["d": 2, ".": 4],                 // 1. 'sign' before 'e'
            ["d": 2, ".": 3, "e": 5, " ": 8], // 2. 'digit' before 'dot'
            ["d": 3, "e": 5, " ": 8],         // 3. 'digit' after 'dot'
            ["d": 3],                         // 4. 'digit' after 'dot' (blank before 'dot')
            ["s": 6, "d": 7],                 // 5. 'e'
            ["d": 7],                         // 6. 'sign' after 'e'
            ["d": 7, " ": 8],                 // 7. 'digit' after 'e'
            [" ": 8]                          // 8. end with 'blank'
        ]

        var state = 0 // start with state 0

        for char in s {
            let type: Character
            if char.isNumber {
                type = "d" // digit
            } else if char == "+" || char == "-" {
                type = "s" // sign
            } else if char == "e" || char == "E" {
                type = "e" // e or E
            } else if char == "." || char == " " {
                type = char // dot, blank
            } else {
                return false // unknown
            }

            guard let nextState = states[state][type] else {
                return false // invalid transition
            }

            state = nextState
        }

        return [2, 3, 7, 8].contains(state)
    }
    
    func myAtoi(_ str: String) -> Int {
        var res = 0
        let bndry = Int(Int32.max) / 10
        var i = 0
        var sign = 1
        let length = str.count
        if length == 0 {
            return 0
        }
        let characters = Array(str)
        while i < length && characters[i] == " " {
            i += 1
        }
        if i < length && (characters[i] == "-" || characters[i] == "+") {
            sign = (characters[i] == "-") ? -1 : 1
            i += 1
        }
        while i < length, let digit = characters[i].wholeNumberValue {
            if res > bndry || (res == bndry && digit > 7) {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
            res = res * 10 + digit
            i += 1
        }

        return sign * res
    }
    
    func reverseBookList(_ head: ListNode?) -> [Int] {
        guard let head = head else { return [] }
        var stack: [ListNode] = []
        var node: ListNode? = head
        while let tmp = node {
            stack.append(tmp)
            node = node?.next
        }
        var res: [Int] = Array(repeating: 0, count: stack.count)
        for i in 0 ..< stack.count {
            if let tmp = stack.popLast() {
                res.append(tmp.val)
            }
        }
        return res
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur: ListNode? = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }

}
