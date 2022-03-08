//
//  SetViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 08.03.2022.
//

import Foundation

class SetViewModel {

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
