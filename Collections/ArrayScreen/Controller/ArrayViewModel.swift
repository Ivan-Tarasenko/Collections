//
//  ArrayViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 13.03.2022.
//

import Foundation

class ArrayViewModel {
    private(set) var cellData: [ArrayCollectionViewData] = []
    private var dataManager = ArrayDataManager.shared

    init() {
        cellData = dataManager.fetchArrayData()
    }
}
