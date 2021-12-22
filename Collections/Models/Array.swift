//
//  Model.swift
//  Collections
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import Foundation

class ArrayCreate {

    var myArray = [Int]()
    var addArray = [Int]()

    func timeElapsed (string: String, operation: ()->()) {
        let startTime = CFAbsoluteTimeGetCurrent()
        operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        let ms = Double(timeElapsed)
        let answer = (round(1000 * ms) / 1000)
        return print("Time \(string): \(answer) ms.")
    }

    
}

public extension Array where Element == Int {
    static func generateRandom(size: Int) -> [Int] {
        guard size > 0 else {
            return [Int]()
        }
        return Array(0..<size).shuffled()
    }
}
