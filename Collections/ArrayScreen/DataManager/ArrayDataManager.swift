//
//  ArrayViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 09.03.2022.
//

import Foundation

class ArrayDataManager {

    // Singleton
    static let shared = ArrayDataManager()

     private init() {}

    func fetchArrayData() -> [ArrayCollectionModel] {

        var dataArray = [ArrayCollectionModel]()
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("insertBeginOnce", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("insertBeginOneTime", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("insertMiddleOnce", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("insertMiddleOneTime", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("insertTheEndOnce", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("insertTheEndOneTime", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("removeBeginOnce", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("removeBeginOneTime", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("removeMiddleOnce", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("removeMiddleOneTime", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("removeTheEndOnce", comment: "")))
        dataArray.append(ArrayCollectionModel(title: NSLocalizedString("removeTheEndOneTime", comment: "")))
        return dataArray
    }
}
