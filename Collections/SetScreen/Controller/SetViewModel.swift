//
//  SetViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 08.03.2022.
//

import Foundation

class SetViewModel {

    let titleAllMatch = NSLocalizedString("titleAllMatching", comment: "title button allMatch")
    let titleAllDoNotMatch = NSLocalizedString("titleAllCharacterDoNotMatch", comment: "title button allDoNotMatch")
    let titleUniqueButton = NSLocalizedString("titleUniqueSymbols", comment: "title button uniqueCharacter")

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
