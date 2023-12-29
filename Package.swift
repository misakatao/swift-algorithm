// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let fileManager = FileManager.default
let currentDirectoryURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)

// 查找当前目录中的 Swift 文件
let files: [URL] = try fileManager.contentsOfDirectory(at: currentDirectoryURL, includingPropertiesForKeys: nil).filter { $0.pathExtension == "swift" }

func fileWithoutExtension(_ file: String) -> String {
    guard let dotIndex = file.firstIndex(of: ".") else { return file }
    return String(file[..<dotIndex])
}

func getPath(_ path: String) -> String {
    let components = path.components(separatedBy: "/")
    return components.dropLast().joined(separator: "/")
}

func getFile(_ path: String) -> String {
    let components = path.components(separatedBy: "/")
    return components.last!
}

let myfiles: [String] = [
    // DataStructure
    "./Sources/DataStructure/AVLTree.swift",
    "./Sources/DataStructure/BinarySearchTree.swift",
    "./Sources/DataStructure/GraphAdjacencyList.swift",
    "./Sources/DataStructure/GraphAdjacencyMatrix.swift",
    "./Sources/DataStructure/Heap.swift",
    
    // LCP
    "./Sources/LCP/guess-numbers.swift",
    "./Sources/LCP/na-ying-bi.swift",
    
    // LCR
    "./Sources/LCR/NUPfPr.swift",
    "./Sources/LCR/xoh6Oh.swift",
    "./Sources/LCR/xx4gT2.swift",
    
    // Leetcode
    
    /// BackTracking
    "./Sources/Leetcode/BackTracking/combination-sum-ii.swift",
    "./Sources/Leetcode/BackTracking/combination-sum.swift",
    "./Sources/Leetcode/BackTracking/combinations.swift",
    "./Sources/Leetcode/BackTracking/generalized-abbreviation.swift",
    "./Sources/Leetcode/BackTracking/n-queens-ii.swift",
    "./Sources/Leetcode/BackTracking/n-queens.swift",
    "./Sources/Leetcode/BackTracking/permutations-ii.swift",
    "./Sources/Leetcode/BackTracking/permutations.swift",
    "./Sources/Leetcode/BackTracking/subsets-ii.swift",
    "./Sources/Leetcode/BackTracking/subsets.swift",
    
    /// BinarySearch
    "./Sources/Leetcode/BinarySearch/binary-search.swift",
    "./Sources/Leetcode/BinarySearch/capacity-to-ship-packages-within-d-days.swift",
    "./Sources/Leetcode/BinarySearch/find-first-and-last-position-of-element-in-sorted-array.swift",
    "./Sources/Leetcode/BinarySearch/koko-eating-bananas.swift",
    "./Sources/Leetcode/BinarySearch/split-array-largest-sum.swift",
    "./Sources/Leetcode/BinarySearch/two-sum-ii-input-array-is-sorted.swift",
    
    /// BinaryTree
    "./Sources/Leetcode/BinaryTree/balanced-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/binary-search-tree-to-greater-sum-tree.swift",
    "./Sources/Leetcode/BinaryTree/binary-tree-inorder-traversal.swift",
    "./Sources/Leetcode/BinaryTree/binary-tree-level-order-traversal.swift",
    "./Sources/Leetcode/BinaryTree/binary-tree-maximum-path-sum.swift",
    "./Sources/Leetcode/BinaryTree/binary-tree-paths.swift",
    "./Sources/Leetcode/BinaryTree/binary-tree-postorder-traversal.swift",
    "./Sources/Leetcode/BinaryTree/binary-tree-preorder-traversal.swift",
    "./Sources/Leetcode/BinaryTree/binary-tree-right-side-view.swift",
    "./Sources/Leetcode/BinaryTree/binary-tree-zigzag-level-order-traversal.swift",
    "./Sources/Leetcode/BinaryTree/construct-binary-tree-from-preorder-and-inorder-traversal.swift",
    "./Sources/Leetcode/BinaryTree/construct-binary-tree-from-inorder-and-postorder-traversal.swift",
    "./Sources/Leetcode/BinaryTree/construct-binary-tree-from-preorder-and-postorder-traversal.swift",
    "./Sources/Leetcode/BinaryTree/diameter-of-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/flatten-binary-tree-to-linked-list.swift",
    "./Sources/Leetcode/BinaryTree/insert-into-a-binary-search-tree.swift",
    "./Sources/Leetcode/BinaryTree/invert-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/lowest-common-ancestor-of-a-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/maximum-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/maximum-depth-of-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/minimum-depth-of-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/path-sum-ii.swift",
    "./Sources/Leetcode/BinaryTree/path-sum.swift",
    "./Sources/Leetcode/BinaryTree/populating-next-right-pointers-in-each-node.swift",
    "./Sources/Leetcode/BinaryTree/same-tree.swift",
    "./Sources/Leetcode/BinaryTree/search-in-a-binary-search-tree.swift",
    "./Sources/Leetcode/BinaryTree/sum-root-to-leaf-numbers.swift",
    "./Sources/Leetcode/BinaryTree/symmetric-tree.swift",
    "./Sources/Leetcode/BinaryTree/unique-binary-search-trees-ii.swift",
    "./Sources/Leetcode/BinaryTree/unique-binary-search-trees.swift",
    "./Sources/Leetcode/BinaryTree/validate-binary-search-tree.swift",
    
    /// DynamicProgramming
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock-iii.swift",
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock-ii.swift",
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock-iv.swift",
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock-with-cooldown.swift",
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock-with-transaction-fee.swift",
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock.swift",
    "./Sources/Leetcode/DynamicProgramming/burst-balloons.swift",
    "./Sources/Leetcode/DynamicProgramming/climbing-stairs.swift",
    "./Sources/Leetcode/DynamicProgramming/coin-change.swift",
    "./Sources/Leetcode/DynamicProgramming/fibonacci-number.swift",
    "./Sources/Leetcode/DynamicProgramming/house-robber-ii.swift",
    "./Sources/Leetcode/DynamicProgramming/house-robber-iii.swift",
    "./Sources/Leetcode/DynamicProgramming/house-robber.swift",
    
    /// root
    "./Sources/Leetcode/add-two-numbers.swift",
    "./Sources/Leetcode/kth-largest-element-in-an-array.swift",
    "./Sources/Leetcode/merge-k-sorted-lists.swift",
    "./Sources/Leetcode/merge-two-sorted-lists.swift",
    "./Sources/Leetcode/minimum-jumps-to-reach-home.swift",
    "./Sources/Leetcode/partition-equal-subset-sum.swift",
    "./Sources/Leetcode/remove-nth-node-from-end-of-list.swift",
    "./Sources/Leetcode/reverse-linked-list-ii.swift",
    "./Sources/Leetcode/reverse-linked-list.swift",
    "./Sources/Leetcode/rotate-list.swift",
    "./Sources/Leetcode/sort-an-array.swift",
    "./Sources/Leetcode/super-egg-drop.swift",
    "./Sources/Leetcode/two-sum.swift",
]

let executableTargets: [Target] = myfiles.map { .executableTarget(name: fileWithoutExtension(getFile($0)),
                                                                  dependencies: ["Utils"],
                                                                  path: getPath($0),
                                                                  sources: [getFile($0)]) }

let products: [Product] = executableTargets.map { .executable(name: $0.name,
                                                              targets: [$0.name]) }

let package = Package(
    name: "SwiftAlgorithm",
    products: products,
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-collections", branch: "release/1.1")
    ],
    targets: [
        .target(name: "Utils", dependencies: [.product(name: "Collections", package: "swift-collections")], path: "Sources/Utils"),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        // .testTarget(name: "MyLibraryTests", dependencies: ["MyLibrary"]),
    ] + executableTargets
)
