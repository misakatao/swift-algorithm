//
//  9.回文数.swift
//  swift-algorithm
//
//  Created by Misaka on 2023/8/2.
//

import Foundation

extension Solution {
 
    func isPalindrome(_ x: Int) -> Bool {
        var x = x
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        
        var revert = 0
        while x > revert {
            revert = revert * 10 + x % 10
            x /= 10
        }
        
        return x == revert || x == revert / 10
    }
}
