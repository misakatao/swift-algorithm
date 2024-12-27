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
    "./Sources/Leetcode/BackTracking/combination-sum.swift",
    "./Sources/Leetcode/BackTracking/combination-sum-ii.swift",
    "./Sources/Leetcode/BackTracking/combinations.swift",
    "./Sources/Leetcode/BackTracking/generalized-abbreviation.swift",
    "./Sources/Leetcode/BackTracking/n-queens.swift",
    "./Sources/Leetcode/BackTracking/n-queens-ii.swift",
    "./Sources/Leetcode/BackTracking/permutations.swift",
    "./Sources/Leetcode/BackTracking/permutations-ii.swift",
    "./Sources/Leetcode/BackTracking/subsets.swift",
    "./Sources/Leetcode/BackTracking/subsets-ii.swift",
    
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
    "./Sources/Leetcode/BinaryTree/binary-tree-vertical-order-traversal.swift",
    "./Sources/Leetcode/BinaryTree/binary-tree-zigzag-level-order-traversal.swift",
    "./Sources/Leetcode/BinaryTree/binary-trees-with-factors.swift",
    "./Sources/Leetcode/BinaryTree/construct-binary-tree-from-inorder-and-postorder-traversal.swift",
    "./Sources/Leetcode/BinaryTree/construct-binary-tree-from-preorder-and-inorder-traversal.swift",
    "./Sources/Leetcode/BinaryTree/construct-binary-tree-from-preorder-and-postorder-traversal.swift",
    "./Sources/Leetcode/BinaryTree/convert-bst-to-greater-tree.swift",
    "./Sources/Leetcode/BinaryTree/count-complete-tree-nodes.swift",
    "./Sources/Leetcode/BinaryTree/delete-node-in-a-bst.swift",
    "./Sources/Leetcode/BinaryTree/diameter-of-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/flatten-binary-tree-to-linked-list.swift",
    "./Sources/Leetcode/BinaryTree/insert-into-a-binary-search-tree.swift",
    "./Sources/Leetcode/BinaryTree/invert-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/kth-smallest-element-in-a-bst.swift",
    "./Sources/Leetcode/BinaryTree/lowest-common-ancestor-of-a-binary-search-tree.swift",
    "./Sources/Leetcode/BinaryTree/lowest-common-ancestor-of-a-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/maximum-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/maximum-depth-of-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/minimum-depth-of-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/path-sum.swift",
    "./Sources/Leetcode/BinaryTree/path-sum-ii.swift",
    "./Sources/Leetcode/BinaryTree/populating-next-right-pointers-in-each-node.swift",
    "./Sources/Leetcode/BinaryTree/same-tree.swift",
    "./Sources/Leetcode/BinaryTree/search-in-a-binary-search-tree.swift",
    "./Sources/Leetcode/BinaryTree/serialize-and-deserialize-binary-tree.swift",
    "./Sources/Leetcode/BinaryTree/sum-root-to-leaf-numbers.swift",
    "./Sources/Leetcode/BinaryTree/symmetric-tree.swift",
    "./Sources/Leetcode/BinaryTree/unique-binary-search-trees.swift",
    "./Sources/Leetcode/BinaryTree/unique-binary-search-trees-ii.swift",
    "./Sources/Leetcode/BinaryTree/validate-binary-search-tree.swift",
    
    /// DynamicProgramming
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock.swift",
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock-ii.swift",
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock-iii.swift",
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock-iv.swift",
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock-with-cooldown.swift",
    "./Sources/Leetcode/DynamicProgramming/best-time-to-buy-and-sell-stock-with-transaction-fee.swift",
    "./Sources/Leetcode/DynamicProgramming/burst-balloons.swift",
    "./Sources/Leetcode/DynamicProgramming/climbing-stairs.swift",
    "./Sources/Leetcode/DynamicProgramming/coin-change.swift",
    "./Sources/Leetcode/DynamicProgramming/fibonacci-number.swift",
    "./Sources/Leetcode/DynamicProgramming/house-robber.swift",
    "./Sources/Leetcode/DynamicProgramming/house-robber-ii.swift",
    "./Sources/Leetcode/DynamicProgramming/house-robber-iii.swift",
    
    /// root
    "./Sources/Leetcode/3sum.swift",
    "./Sources/Leetcode/4sum.swift",
    "./Sources/Leetcode/add-two-numbers.swift",
    "./Sources/Leetcode/advantage-shuffle.swift",
    "./Sources/Leetcode/buildings-with-an-ocean-view.swift",
    "./Sources/Leetcode/candy.swift",
    "./Sources/Leetcode/car-pooling.swift",
    "./Sources/Leetcode/container-with-most-water.swift",
    "./Sources/Leetcode/corporate-flight-bookings.swift",
    "./Sources/Leetcode/count-of-range-sum.swift",
    "./Sources/Leetcode/count-of-smaller-numbers-after-self.swift",
    "./Sources/Leetcode/count-servers-that-communicate.swift",
    "./Sources/Leetcode/find-all-anagrams-in-a-string.swift",
    "./Sources/Leetcode/find-and-replace-in-string.swift",
    "./Sources/Leetcode/find-duplicate-subtrees.swift",
    "./Sources/Leetcode/find-largest-value-in-each-tree-row.swift",
    "./Sources/Leetcode/find-the-index-of-the-first-occurrence-in-a-string.swift",
    "./Sources/Leetcode/find-the-losers-of-the-circular-game.swift",
    "./Sources/Leetcode/first-missing-positive.swift",
    "./Sources/Leetcode/form-array-by-concatenating-subarrays-of-another-array.swift",
    "./Sources/Leetcode/gas-station.swift",
    "./Sources/Leetcode/group-anagrams.swift",
    "./Sources/Leetcode/insert-delete-getrandom-o1.swift",
    "./Sources/Leetcode/insert-interval.swift",
    "./Sources/Leetcode/interleaving-string.swift",
    "./Sources/Leetcode/intersection-of-two-linked-lists.swift",
    //"./Sources/Leetcode/jump-game.swift",
    "./Sources/Leetcode/jump-game-ii.swift",
    "./Sources/Leetcode/kth-largest-element-in-an-array.swift",
    "./Sources/Leetcode/largest-rectangle-in-histogram.swift",
    "./Sources/Leetcode/lfu-cache.swift",
    "./Sources/Leetcode/linked-list-cycle.swift",
    "./Sources/Leetcode/linked-list-cycle-ii.swift",
    "./Sources/Leetcode/longest-consecutive-sequence.swift",
    "./Sources/Leetcode/longest-palindromic-substring.swift",
    "./Sources/Leetcode/longest-substring-without-repeating-characters.swift",
    "./Sources/Leetcode/matrix-diagonal-sum.swift",
    "./Sources/Leetcode/maximize-distance-to-closest-person.swift",
    "./Sources/Leetcode/maximum-absolute-sum-of-any-subarray.swift",
    "./Sources/Leetcode/maximum-candies-allocated-to-k-children.swift",
    "./Sources/Leetcode/maximum-subarray.swift",
    "./Sources/Leetcode/median-of-two-sorted-arrays.swift",
    "./Sources/Leetcode/merge-intervals.swift",
    "./Sources/Leetcode/merge-k-sorted-lists.swift",
    "./Sources/Leetcode/merge-sorted-array.swift",
    "./Sources/Leetcode/merge-two-binary-trees.swift",
    "./Sources/Leetcode/merge-two-sorted-lists.swift",
    "./Sources/Leetcode/middle-of-the-linked-list.swift",
    "./Sources/Leetcode/minimize-maximum-of-array.swift",
    "./Sources/Leetcode/minimum-jumps-to-reach-home.swift",
    "./Sources/Leetcode/minimum-time-to-complete-trips.swift",
    "./Sources/Leetcode/minimum-time-to-repair-cars.swift",
    "./Sources/Leetcode/minimum-window-substring.swift",
    "./Sources/Leetcode/move-pieces-to-obtain-a-string.swift",
    "./Sources/Leetcode/move-zeroes.swift",
    "./Sources/Leetcode/nth-magical-number.swift",
    "./Sources/Leetcode/number-of-ways-of-cutting-a-pizza.swift",
    "./Sources/Leetcode/number-of-ways-to-buy-pens-and-pencils.swift",
    "./Sources/Leetcode/open-the-lock.swift",
    "./Sources/Leetcode/palindrome-linked-list.swift",
    "./Sources/Leetcode/palindrome-number.swift",
    "./Sources/Leetcode/partition-equal-subset-sum.swift",
    "./Sources/Leetcode/partition-list.swift",
    "./Sources/Leetcode/pascals-triangle.swift",
    "./Sources/Leetcode/permutation-in-string.swift",
    "./Sources/Leetcode/pizza-with-3n-slices.swift",
    "./Sources/Leetcode/product-of-array-except-self.swift",
    "./Sources/Leetcode/random-pick-with-blacklist.swift",
    "./Sources/Leetcode/random-pick-with-weight.swift",
    "./Sources/Leetcode/range-addition.swift",
    "./Sources/Leetcode/range-sum-query-2d-immutable.swift",
    "./Sources/Leetcode/range-sum-query-immutable.swift",
    "./Sources/Leetcode/remove-duplicate-letters.swift",
    "./Sources/Leetcode/remove-duplicates-from-sorted-array.swift",
    "./Sources/Leetcode/remove-duplicates-from-sorted-list.swift",
    "./Sources/Leetcode/remove-duplicates-from-sorted-list-ii.swift",
    "./Sources/Leetcode/remove-element.swift",
    "./Sources/Leetcode/remove-k-digits.swift",
    "./Sources/Leetcode/remove-nth-node-from-end-of-list.swift",
    "./Sources/Leetcode/repeated-dna-sequences.swift",
    "./Sources/Leetcode/reverse-linked-list.swift",
    "./Sources/Leetcode/reverse-linked-list-ii.swift",
    "./Sources/Leetcode/reverse-nodes-in-k-group.swift",
    "./Sources/Leetcode/reverse-pairs.swift",
    "./Sources/Leetcode/reverse-string.swift",
    "./Sources/Leetcode/rotate-image.swift",
    "./Sources/Leetcode/rotate-list.swift",
    "./Sources/Leetcode/search-insert-position.swift",
    "./Sources/Leetcode/smallest-rotation-with-highest-score.swift",
    "./Sources/Leetcode/smallest-subsequence-of-distinct-characters.swift",
    "./Sources/Leetcode/smallest-subtree-with-all-the-deepest-nodes.swift",
    "./Sources/Leetcode/sort-an-array.swift",
    "./Sources/Leetcode/spiral-matrix.swift",
    "./Sources/Leetcode/spiral-matrix-ii.swift",
    "./Sources/Leetcode/subarray-sum-equals-k.swift",
    "./Sources/Leetcode/subtract-the-product-and-sum-of-digits-of-an-integer.swift",
    "./Sources/Leetcode/summary-ranges.swift",
    "./Sources/Leetcode/super-egg-drop.swift",
    "./Sources/Leetcode/trapping-rain-water.swift",
    "./Sources/Leetcode/two-sum.swift",
    "./Sources/Leetcode/valid-parentheses.swift",
    "./Sources/Leetcode/zigzag-conversion.swift",
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
