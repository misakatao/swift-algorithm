//
//  swift-algorithm
//
//  Created by Misaka on 2023/8/18.
//
//  反转字符串中的单词

import Foundation

extension Solution {
    /*
     给你一个字符串 s ，请你反转字符串中 单词 的顺序。

     单词 是由非空格字符组成的字符串。s 中使用至少一个空格将字符串中的 单词 分隔开。

     返回 单词 顺序颠倒且 单词 之间用单个空格连接的结果字符串。

     注意：输入字符串 s中可能会存在前导空格、尾随空格或者单词间的多个空格。返回的结果字符串中，单词间应当仅用单个空格分隔，且不包含任何额外的空格。
     */
    func reverseWords(_ s: String) -> String {
        // 去除多余空格
        func trim_spaces(_ chs: [Character]) -> [Character] {
            var left = 0
            var right: Int = chs.count - 1
            // 去除开头空格
            while left <= right && chs[left] == " " {
                left += 1
            }
            // 去除尾部空格
            while left <= right && chs[right] == " " {
                right -= 1
            }
            var output: [Character] = []
            // 去除中间多余空格
            while left <= right {
                if chs[left] != " " {
                    output.append(chs[left])
                } else if output[output.count - 1] != " " {
                    output.append(chs[left])
                }
                left += 1
            }
            return output
        }

        // 反转整个字符串
        func reverse(_ chs: inout [Character], _ left: Int, _ right: Int) {
            var left = left
            var right = right
            while left <= right {
                let tmp = chs[left]
                chs[left] = chs[right]
                left += 1
                chs[right] = tmp
                right -= 1
            }
        }

        // 反转单词
        func reverseEachWord(_ chs: inout [Character]) {
            let len = chs.count
            var start = 0
            var end = 0
            while start < len {
                // 循环至单词的末尾
                while end < len && chs[end] != " " {
                    end += 1
                }
                // 翻转单词
                reverse(&chs, start, end - 1)
                // 更新start，去找下一个单词
                start = end + 1
                end += 1
            }
        }

        var chs: [Character] = trim_spaces(Array(s))
        // 反转字符串
        reverse(&chs, 0, chs.count - 1)
        // 反转每个单词
        reverseEachWord(&chs)
        return String(chs)
    }
}
