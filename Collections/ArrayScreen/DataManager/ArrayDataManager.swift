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
    
    let insertBeginOnce = NSLocalizedString("insertBeginOnce", comment: "")
    let insertBeginOneTime = NSLocalizedString("insertBeginOneTime", comment: "")
    let insertMiddleOnce = NSLocalizedString("insertMiddleOnce", comment: "")
    let insertMiddleOneTime = NSLocalizedString("insertMiddleOneTime", comment: "")
    let insertTheEndOnce = NSLocalizedString("insertTheEndOnce", comment: "")
    let insertTheEndOneTime = NSLocalizedString("insertTheEndOneTime", comment: "")
    let removeBeginOnce = NSLocalizedString("removeBeginOnce", comment: "")
    let removeBeginOneTime = NSLocalizedString("removeBeginOneTime", comment: "")
    let removeMiddleOnce = NSLocalizedString("removeMiddleOnce", comment: "")
    let removeMiddleOneTime = NSLocalizedString("removeMiddleOneTime", comment: "")
    let removeTheEndOnce = NSLocalizedString("removeTheEndOnce", comment: "")
    let removeTheEndOneTime = NSLocalizedString("removeTheEndOneTime", comment: "")

    func fetchArrayData() -> [ArrayCollectionViewData] {

        var dataArray = [ArrayCollectionViewData]()
        dataArray.append(ArrayCollectionViewData(title: insertBeginOnce))
        dataArray.append(ArrayCollectionViewData(title: insertBeginOneTime))
        dataArray.append(ArrayCollectionViewData(title: insertMiddleOnce))
        dataArray.append(ArrayCollectionViewData(title: insertMiddleOneTime))
        dataArray.append(ArrayCollectionViewData(title: insertTheEndOnce))
        dataArray.append(ArrayCollectionViewData(title: insertTheEndOneTime))
        dataArray.append(ArrayCollectionViewData(title: removeBeginOnce))
        dataArray.append(ArrayCollectionViewData(title: removeBeginOneTime))
        dataArray.append(ArrayCollectionViewData(title: removeMiddleOnce))
        dataArray.append(ArrayCollectionViewData(title: removeMiddleOneTime))
        dataArray.append(ArrayCollectionViewData(title: removeTheEndOnce))
        dataArray.append(ArrayCollectionViewData(title: removeTheEndOneTime))
        return dataArray
    }
}
