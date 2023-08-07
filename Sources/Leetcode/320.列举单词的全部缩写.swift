//
//  320.列举单词的全部缩写.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/4.
//

import Foundation

extension Solution {
    
    func generateAbbreviations(_ word: String) -> [String] {
        
        var result = [String]()
        let chars = Array(word)
        var current = [Character]()
        
        func backtrack(_ chars: [Character], _ index: Int, _ current: inout [Character], _ count: Int) {
            if index == chars.count {
                if count > 0 {
                    current.append(Character(String(count)))
                }
                result.append(String(current))
                return
            }
            
            let char = chars[index]
            
            // 不缩写当前字符
            current.append(char)
            backtrack(chars, index + 1, &current, 0)
            current.removeLast()
            
            // 缩写当前字符
            if count > 0 {
                current.append(Character(String(count)))
            }
            current.append(char)
            backtrack(chars, index + 1, &current, 0)
            current.removeLast()
            
            // 跳过当前字符，增加 count
            backtrack(chars, index + 1, &current, count + 1)
        }
        
        backtrack(chars, 0, &current, 0)
        
        return result
    }
    
    
}
