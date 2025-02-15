//
//  zigzag-conversion.swift
//
//
//  Created by Misaka on 2023/8/18.
//

/**
 N 字形变换
 
 将一个给定字符串 s 根据给定的行数 numRows ，以从上往下、从左到右进行 Z 字形排列。

 比如输入字符串为 "PAYPALISHIRING" 行数为 3 时，排列如下：

 P   A   H   N
 A P L S I I G
 Y   I   R
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："PAHNAPLSIIGYIR"。

 请你实现这个将字符串进行指定行数变换的函数：

 string convert(string s, int numRows);
 */

import Foundation

import Utils

@main
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows < 2 { return s }
        var res: [String] = Array(repeating: "", count: numRows)
        var i = 0
        var flag = false
        for ch in Array(s) {
            res[i] += String(ch)
            if i == 0 || i == numRows - 1 {
                flag = !flag
            }
            i += flag ? 1 : -1
        }
        return res.joined()
    }
    
    static func main() {
        
    }
}
