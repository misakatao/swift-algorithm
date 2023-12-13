// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAlgorithm",
    products: [
        .executable(name: "AVLTree", targets: ["AVLTree"]),
        .executable(name: "Heap", targets: ["Heap"]),
        .executable(name: "GraphAdjacencyMatrix", targets: ["GraphAdjacencyMatrix"]),
        .executable(name: "GraphAdjacencyList", targets: ["GraphAdjacencyList"]),
        .executable(name: "two-sum", targets: ["two-sum"]),
        .executable(name: "partition-equal-subset-sum", targets: ["partition-equal-subset-sum"]),
        .executable(name: "kth-largest-element-in-an-array", targets: ["kth-largest-element-in-an-array"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-collections", branch: "release/1.1")
    ],
    targets: [
        .target(name: "Utils", dependencies: [.product(name: "Collections", package: "swift-collections")], path: "Sources/Utils"),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.    
        .executableTarget(name: "AVLTree", dependencies: ["Utils"], path: "Sources/DataStructure", sources: ["AVLTree.swift"]),
        .executableTarget(name: "Heap", dependencies: ["Utils"], path: "Sources/DataStructure", sources: ["Heap.swift"]),
        .executableTarget(name: "GraphAdjacencyMatrix", dependencies: ["Utils"], path: "Sources/DataStructure", sources: ["GraphAdjacencyMatrix.swift"]),
        .executableTarget(name: "GraphAdjacencyList", dependencies: ["Utils"], path: "Sources/DataStructure", sources: ["GraphAdjacencyList.swift"]),
        .executableTarget(name: "two-sum", dependencies: ["Utils"], path: "Sources/Leetcode", sources: ["two-sum.swift"]),
        .executableTarget(name: "partition-equal-subset-sum", dependencies: ["Utils"], path: "Sources/Leetcode", sources: ["partition-equal-subset-sum.swift"]),
        .executableTarget(name: "kth-largest-element-in-an-array", dependencies: ["Utils"], path: "Sources/Leetcode", sources: ["kth-largest-element-in-an-array.swift"]),
        
        // .testTarget(name: "MyLibraryTests", dependencies: ["MyLibrary"]),
    ]
)
