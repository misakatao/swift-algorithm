//
//  AVLTree.swift
//  
//
//  Created by Misaka on 2023/12/13.
//

/**
 AVL 树
 */

import Foundation
import Utils

public class AVLTree {
    
    fileprivate var root: TreeNode? // 根节点

    /// 获取节点高度
    public func height(_ node: TreeNode?) -> Int {
        node == nil ? -1 : node!.height
    }
    
    /// 更新节点高度
    private func updateHeight(_ node: TreeNode?) {
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }
    
    /// 获取平衡因子
    public func balanceFactor(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        return height(node.left) - height(node.right)
    }

    /// 右旋
    private func rightRotate(_ node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // 以 child 为原点，将 node 向右旋转
        child?.right = node
        node?.left = grandChild
        updateHeight(node)
        updateHeight(child)
        return child
    }
    
    /// 左旋
    private func leftRotate(_ node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // 以 child 为原点，将 node 向左旋转
        child?.left = node
        node?.right = grandChild
        updateHeight(node)
        updateHeight(child)
        return child
    }

    /// 旋转
    private func rotate(_ node: TreeNode?) -> TreeNode? {
        let balanceFactor = balanceFactor(node)
        // 左偏树
        if balanceFactor > 1 {
            if self.balanceFactor(node?.left) >= 0 {
                // 右旋
                return rightRotate(node)
            } else {
                // 先左旋后右旋
                node?.left = leftRotate(node?.left)
                return rightRotate(node)
            }
        }
        // 右偏树
        if balanceFactor < -1 {
            if self.balanceFactor(node?.right) <= 0 {
                // 左旋
                return leftRotate(node)
            } else {
                // 先右旋后左旋
                node?.right = rightRotate(node?.right)
                return leftRotate(node)
            }
        }
        return node
    }
    
    /// 插入节点
    public func insert(_ num: Int) {
        root = insertHelper(root, num)
    }
    
    /// 删除节点
    public func remove(_ num: Int) {
        root = removeHelper(root, num)
    }
    
    /// 查找节点
    public func search(_ num: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            if cur!.val < num {
                cur = cur?.right
            } else if cur!.val > num {
                cur = cur?.left
            } else {
                break
            }
        }
        return cur
    }
    
    private func insertHelper(_ node: TreeNode?, _ val: Int) -> TreeNode? {
        if node == nil {
            return TreeNode(val)
        }
        if val < node!.val {
            node?.left = insertHelper(node?.left, val)
        } else if val > node!.val {
            node?.right = insertHelper(node?.right, val)
        } else {
            return node
        }
        updateHeight(node)
        return rotate(node)
    }
    
    private func removeHelper(_ node: TreeNode?, _ val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        if val < node!.val {
            node?.left = removeHelper(node?.left, val)
        } else if val > node!.val {
            node?.right = removeHelper(node?.right, val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left != nil ? node?.left : node?.right
                // 子节点数量 = 0 ，直接删除 node 并返回
                if child == nil {
                    return nil
                }
                // 子节点数量 = 1 ，直接删除 node
                else {
                    node = child
                }
            } else {
                // 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
                var tmp = node?.right
                while tmp?.left != nil {
                    tmp = tmp?.left
                }
                node?.right = removeHelper(node?.right, tmp!.val)
                node?.val = tmp!.val
            }
        }
        updateHeight(node)
        return rotate(node)
    }
}

@main
class Solution {
    
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val)
        print("\n插入节点 \(val) 后，AVL 树为")
        PrintUtil.printTree(tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val)
        print("\n删除节点 \(val) 后，AVL 树为")
        PrintUtil.printTree(tree.root)
    }
    
    static func main() {
        /* 初始化空 AVL 树 */
        let avlTree = AVLTree()

        /* 插入节点 */
        // 请关注插入节点后，AVL 树是如何保持平衡的
        testInsert(tree: avlTree, val: 1)
        testInsert(tree: avlTree, val: 2)
        testInsert(tree: avlTree, val: 3)
        testInsert(tree: avlTree, val: 4)
        testInsert(tree: avlTree, val: 5)
        testInsert(tree: avlTree, val: 8)
        testInsert(tree: avlTree, val: 7)
        testInsert(tree: avlTree, val: 9)
        testInsert(tree: avlTree, val: 10)
        testInsert(tree: avlTree, val: 6)

        /* 插入重复节点 */
        testInsert(tree: avlTree, val: 7)

        /* 删除节点 */
        // 请关注删除节点后，AVL 树是如何保持平衡的
        testRemove(tree: avlTree, val: 8) // 删除度为 0 的节点
        testRemove(tree: avlTree, val: 5) // 删除度为 1 的节点
        testRemove(tree: avlTree, val: 4) // 删除度为 2 的节点

        /* 查询节点 */
        let node = avlTree.search(7)
        print("\n查找到的节点对象为 \(node!)，节点值 = \(node!.val)")
    }
}
