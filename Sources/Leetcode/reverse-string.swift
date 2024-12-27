//
//  reverse-string.swift
//
//
//  Created by Misaka on 2023/8/10.
//

/**
 反转字符串
 */

import Foundation
import Utils

@main
class Solution {
    /*
     编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 s 的形式给出。

     不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
     */
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right: Int = s.count - 1

        while left < right {
            let temp = s[left]
            s[left] = s[right]
            s[right] = temp
            left += 1
            right -= 1
        }
    }
    
    static func main() {
        
    }
}
