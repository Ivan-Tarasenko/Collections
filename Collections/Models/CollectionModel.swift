//
//  Model.swift
//  Collections
//
//  Created by Иван Тарасенко on 22.02.2022.
//

import Foundation

struct TableViewText {
    let nameCell: String
}

class CollectionModel {

    // MARK: - Method for determining the algorithm execution speed.
    func taskCompletionTime (string: String, execute: () -> Void ) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        execute()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        let timeElapsedDouble = Double(timeElapsed)
        let answer = (round(1000 * timeElapsedDouble) / 1000)
        return "Time \(string): \(answer) ms."
    }

    // MARK: - The result of comparing two sets and the output of all matching characters
    func answerMatchingletter(first: String, second: String) -> String {
        let firstSet = Set(first)
        let secondSet = Set(second)
        let answer = firstSet.intersection(secondSet)
        return String(answer.sorted())
    }

    // MARK: - The result of comparing two sets and the output of all non-matching characters
    func answerDoNotMatchLetter(first: String, second: String) -> String {
        let firstSet = Set(first)
        let secondSet = Set(second)
        let answer = firstSet.symmetricDifference(secondSet)
        return String(answer.sorted())
    }

    // MARK: - Returns elements of the first set that are missing in the second
    func answerCharacterDifference(first: String, second: String) -> String {
        let firstSet = Set(first)
        let secondSet = Set(second)
        let answer = firstSet.subtracting(secondSet)
        return String(answer.sorted())
    }
}
