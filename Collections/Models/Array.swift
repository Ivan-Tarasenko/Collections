//
//  Model.swift
//  Collections
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import Foundation

class ArrayCreate {

    var operationOptions = [ "Big Array of 10 000 000 elements",
                            "Inserting 1000 elements at the beginning of the array at once",
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

    var bigArray = [Int]()
    var addArray = [Int]()


    func timeOperation (string: String, operation: () -> Void ) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        let mls = Double(timeElapsed)
        let answer = (round(1000 * mls) / 1000)
        return "Time \(string): \(answer) ms."
    }
}
