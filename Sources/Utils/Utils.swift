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

public func printTime(_ closure: @escaping (() -> Void)) {
    //NSLog("耗时: %f ms", measureTime(closure) * 1000)
    print(String(format: "耗时: %f ms", measureTime(closure) * 1000))
    
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
        let jsonData = try JSONSerialization.data(withJSONObject: obj, options: [.prettyPrinted])
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        }
    } catch {
        print("Error converting to JSON: \(error)")
    }
}
