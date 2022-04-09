//
//  DictionaryDataManager.swift
//  Collections
//
//  Created by Иван Тарасенко on 08.04.2022.
//

import Foundation

class DictionaryDataManager {

    // Singlton
    static let dicShared = DictionaryDataManager()

    private init() {}

    func fetchDictionaryData() -> [DictionaryCollectionModel] {
        var data = [DictionaryCollectionModel]()
        data.append(DictionaryCollectionModel(title: NSLocalizedString("findFirst", comment: "")) )
        data.append(DictionaryCollectionModel(title: NSLocalizedString("findLast", comment: "")) )
        data.append(DictionaryCollectionModel(title: NSLocalizedString("searchForNonExisting", comment: "")) )
return data
    }
}
