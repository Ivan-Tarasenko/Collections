//
//  DictionaryModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 27.03.2022.
//

import Foundation

struct DictionaryCollectionModel {
    var title: String {
        didSet {
            isDone = true
            isPerfoming = false
        }
    }

    var isPerfoming = false
    var isDone = false
}

struct Contact {
    let name: String
    let numberPhone: String
}
