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

    func timeElapsed (string: String, operation: () -> Void ) {
        let startTime = CFAbsoluteTimeGetCurrent()
        operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        let mls = Double(timeElapsed)
        let answer = (round(1000 * mls) / 1000)
        return print("Time \(string): \(answer) ms.")
    }
}
