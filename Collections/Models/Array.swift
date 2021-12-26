//
//  Model.swift
//  Collections
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import Foundation

class ArrayCreate {

    let operationOptions = ["Inserting 1000 elements at the beginning of the array at once",
                            "Inserting 1000 elements at the beginning of the array one at a time",
                            "Inserting 1000 elements into the middle of the array at once",
                            "Inserting 1000 elements into the middle of the array one at a time",
                            "Inserting 1000 elements at the end of the array at once",
                            "Inserting 1000 elements at the end of the array one at a time",
                            "Removing 1000 elements from the beginning of the array at once",
                            "Removing 1000 elements from the beginning of the array one at a time",
                            "Removing 1000 elements from the middle of the array at once",
                            "Removing 1000 elements from the middle of the array one at a time",
                            "Removing 1000 elements from the end of the array at once",
                            "Removing 1000 elements from the end of the array one at a time"]

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
