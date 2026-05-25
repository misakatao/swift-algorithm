# Swift Algorithm

LeetCode 算法题解的 Swift 实现，使用 Swift Package Manager 组织，每道题目作为独立可执行 Target，方便单独运行和调试。

## 项目结构

```
Sources/
├── DataStructure/       # 数据结构实现
│   ├── AVLTree          # AVL 平衡二叉树
│   ├── BinarySearchTree # 二叉搜索树
│   ├── Heap             # 堆
│   ├── GraphAdjacencyList   # 图（邻接表）
│   └── GraphAdjacencyMatrix # 图（邻接矩阵）
├── Leetcode/            # LeetCode 题解（170+ 题）
│   ├── BackTracking/    # 回溯
│   ├── BinarySearch/    # 二分查找
│   ├── BinaryTree/      # 二叉树
│   └── DynamicProgramming/  # 动态规划
├── LCR/                 # 力扣 LCR 系列
├── LCP/                 # 力扣 LCP 系列
└── Utils/               # 工具类（ListNode, TreeNode 等）
```

## 涵盖专题

| 专题 | 题目数 | 示例 |
|------|--------|------|
| 二叉树 | 35+ | 遍历、构造、BST、LCA、序列化 |
| 动态规划 | 13+ | 股票系列、打家劫舍、零钱兑换 |
| 回溯 | 10+ | 组合、排列、子集、N 皇后 |
| 二分查找 | 6+ | 搜索边界、吃香蕉、分割数组 |
| 链表 | 15+ | 反转、环检测、合并、分隔 |
| 双指针/滑动窗口 | 10+ | 三数之和、最小覆盖子串 |
| 栈/单调栈 | 5+ | 接雨水、柱状图最大矩形 |
| 前缀和/差分 | 5+ | 区间求和、航班预订 |
| 数据结构 | 5 | AVL 树、堆、图 |

## 环境要求

- Swift 5.8+
- macOS / Linux

## 使用方式

```bash
# 克隆项目
git clone https://github.com/misakatao/swift-algorithm.git
cd swift-algorithm

# 运行某道题目（以 two-sum 为例）
swift run two-sum

# 构建全部
swift build
```

## License

MIT
