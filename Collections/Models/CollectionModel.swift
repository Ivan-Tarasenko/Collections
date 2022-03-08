//
//  Model.swift
//  Collections
//
//  Created by Иван Тарасенко on 22.02.2022.
//

import Foundation

struct TableViewNameCell {
    let nameCell: String
}

struct CollectionViewNameCell {
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
}
