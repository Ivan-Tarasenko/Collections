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
            isPerfoming = false
            isDone = true
        }
    }
    var isDone = false
    var isPerfoming = false
}

struct Contact {
    let name: String
    let numberPhone: String
}
