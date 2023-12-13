//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/2.
//
//  回文数

import Foundation

extension Solution {
    /*
     给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。
     回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
     */
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
