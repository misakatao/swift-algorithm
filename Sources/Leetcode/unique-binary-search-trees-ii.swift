//
//  unique-binary-search-trees-ii.swift
//
//
//  Created by Misaka on 2023/9/1.
//

/**
 不同的二叉搜索树 II
 
 给你一个整数 n ，请你生成并返回所有由 n 个节点组成且节点值从 1 到 n 互不相同的不同 二叉搜索树 。可以按 任意顺序 返回答案。
 */

import Utils

@main
class Solution {
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        func build(_ lo: Int, _ hi: Int) -> [TreeNode?] {
            var res: [TreeNode?] = []
            if lo > hi {
                res.append(nil)
                return res
            }
            for i in lo ... hi {
                let lefts = build(lo, i - 1)
                let rights = build(i + 1, hi)
                for left in lefts {
                    for right in rights {
                        let root = TreeNode(i)
                        root.left = left
                        root.right = right
                        res.append(root)
                    }
                }
            }
            return res
        }
        return build(1, n)
    }
    
    static func main() {
        
    }
}
