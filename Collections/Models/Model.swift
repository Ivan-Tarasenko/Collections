//
//  Model.swift
//  Collections
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import Foundation

class Model {

    let title = "Collections"
    let titleBigArray = "Big Array of 10 000 000 elements"

    let titleAllMatching = "All matching letter"
    let titleAllCharacterDoNotMatch = "All characters that don't match"
    let titleUniqueSymbols = "All unique characters from the first text field that don't match in text fields"
    
    var bigArray = [Int]()
    var addArray = [Int]()
    let myArray = ["Array", "Set", "Dictionary"]

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
//
//    func createBigArray() -> [Int] {
//        bigArray = Array(0 ... 9_999_999)
//        return bigArray
//    }

    // MARK: - Method for determining the algorithm execution speed.
    func timeOperation (string: String, operation: () -> Void ) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        let mls = Double(timeElapsed)
        let answer = (round(1000 * mls) / 1000)
        return "Time \(string): \(answer) ms."
    }

    // MARK: - The result of comparing two sets and the output of all matching characters
    func answerMatchingletter(stringOne: String, stringTwo: String) -> String {
        let setOne = Set(stringOne)
        let setTwo = Set(stringTwo)
        let answer = setOne.intersection(setTwo)
        return String(answer.sorted())
    }

    // MARK: - The result of comparing two sets and the output of all non-matching characters
    func answerDoNotMatchLetter(stringOne: String, stringTwo: String) -> String {
        let setOne = Set(stringOne)
        let setTwo = Set(stringTwo)
        let answer = setOne.symmetricDifference(setTwo)
        return String(answer.sorted())
    }

    // MARK: - Returns elements of the first set that are missing in the second
    func answerCharacterDifference(stringOne: String, stringTwo: String) -> String {
        let setOne = Set(stringOne)
        let setTwo = Set(stringTwo)
        let answer = setOne.subtracting(setTwo)
        return String(answer.sorted())
    }
}
