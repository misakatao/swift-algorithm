//
//  BinarySearchTree.swift
//  
//
//  Created by Misaka on 2023/12/13.
//

/**
 二叉搜索树
 */

import Foundation
import Utils

public class BinarySearchTree {
    
    private var root: TreeNode?
    
    /// 获取二叉树根节点
    public func getRoot() -> TreeNode? {
        root
    }
    
    /// 查找节点
    public func search(_ num: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // 目标节点在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 目标节点在 cur 的左子树中
            else if cur!.val > num {
                cur = cur?.left
            }
            // 找到目标节点，跳出循环
            else {
                break
            }
        }
        return cur
    }
    
    /// 插入节点 
    public func insert(_ num: Int) {
        if root == nil {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode?
        while cur != nil {
            // 找到重复节点，直接返回
            if cur!.val == num {
                return
            }
            pre = cur
            // 插入位置在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 插入位置在 cur 的左子树中
            else {
                cur = cur?.left
            }
        }
        // 插入节点
        let node = TreeNode(num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }
    
    /// 删除节点
    public func remove(_ num: Int) {
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        while cur != nil {
            // 找到待删除节点，跳出循环
            if cur!.val == num {
                break
            }
            pre = cur
            // 待删除节点在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 待删除节点在 cur 的左子树中
            else {
                cur = cur?.left
            }
        }
        if cur == nil {
            return
        }
        if cur?.left == nil || cur?.right == nil {
            // 当子节点数量 = 0 / 1 时， child = nil / 该子节点
            let child = cur?.left != nil ? cur?.left : cur?.right
            // 删除节点 cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child
            }
        } else {
            // 获取中序遍历中 cur 的下一个节点
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // 递归删除节点 tmp
            remove(tmp!.val)
            // 用 tmp 覆盖 cur
            cur?.val = tmp!.val
        }
    }
}
