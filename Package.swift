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
    
    // LCR
    "./Sources/LCR/NUPfPr.swift",
    "./Sources/LCR/xx4gT2.swift",
    
    // Leetcode
    /// BinarySearch
    "./Sources/Leetcode/BinarySearch/two-sum-ii-input-array-is-sorted.swift",
    
    "./Sources/Leetcode/kth-largest-element-in-an-array.swift",
    "./Sources/Leetcode/partition-equal-subset-sum.swift",
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
        .target(name: "Leetcode", path: "Leetcode"),
        .target(name: "Utils", dependencies: [.product(name: "Collections", package: "swift-collections")], path: "Sources/Utils"),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        // .testTarget(name: "MyLibraryTests", dependencies: ["MyLibrary"]),
    ] + executableTargets
)
