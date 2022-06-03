//
//  ArrayCollectionModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 09.03.2022.
//

import Foundation

struct ArrayCollectionModel {
    var title: String {
        didSet {
            isDone = true
            isPerfoming = false
        }
    }
    
    var isPerfoming = false
    var isDone = false
}
