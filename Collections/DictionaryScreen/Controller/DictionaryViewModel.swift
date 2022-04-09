//
//  DictionaryViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 29.03.2022.
//

import Foundation

class DictionaryViewModel {
    var arrayContacts = [Int]()

    private(set) var cellData: [DictionaryCollectionModel] = []
    private var dataManager = DictionaryDataManager.dicShared

    init() {
        cellData = dataManager.fetchDictionaryData()
    }

    func doublesArray(sequence: inout[Any]) {
        for element in 0...4
            where element % 2 == 0 {
            sequence.insert(sequence[element], at: element + 1)
            }
    }
}
