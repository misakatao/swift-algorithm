//
//  Utils.swift
//
//
//  Created by Misaka on 2023/12/11.
//

import Foundation
import QuartzCore
import Collections

public func measureTime(_ closure: @escaping (() -> Void)) -> Double {
    let startTime = CACurrentMediaTime()
    closure()
    return CACurrentMediaTime() - startTime
}

struct Print {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSZ"
        return dateFormatter
    }()
}

public func print(_ items: Any...,
                  separator: String = " ",
                  terminator: String = "\n",
                  file: String = #file,
                  funcName: String = #function,
                  line: Int = #line,
                  column: Int = #column) {
#if DEBUG
    let fileName = (file as NSString).lastPathComponent
    let time = Print.dateFormatter.string(from: Date())
    print("\(time) \(fileName)[\(line)]:", terminator: separator)
    let j = items.count - 1
    for (i, item) in items.enumerated() {
        print(item, terminator: i == j ? terminator : separator)
    }
#endif
}

public func printTime(file: String = #file, funcName: String = #function, _ closure: @escaping () -> Void) {
    //NSLog("耗时: %f ms", measureTime(closure) * 1000)
    Utils.print(String(format: "耗时: %f ms", measureTime(closure) * 1000), file: file, funcName: funcName)
}

public func readJSON(_ filePath: String) -> Any? {
    if let data = FileManager.default.contents(atPath: filePath) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
            return json
        } catch {
            print("Error parsing JSON: \(error)")
            return nil
        }
    } else {
        print("File data is empty.")
        return nil
    }
}

public func printJSON(_ obj: Any) {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: obj, options: [.prettyPrinted, .fragmentsAllowed])
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        }
    } catch {
        print("Error converting to JSON: \(error)")
    }
}
