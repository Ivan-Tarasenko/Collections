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

    func fetchArrayData() -> [ArrayCollectionViewData] {

        var dataArray = [ArrayCollectionViewData]()
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("titleBigArray", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("insertBeginOnce", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("insertBeginOneTime", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("insertMiddleOnce", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("insertMiddleOneTime", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("insertTheEndOnce", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("insertTheEndOneTime", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("removeBeginOnce", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("removeBeginOneTime", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("removeMiddleOnce", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("removeMiddleOneTime", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("removeTheEndOnce", comment: "")))
        dataArray.append(ArrayCollectionViewData(
            title: NSLocalizedString("removeTheEndOneTime", comment: "")))
        return dataArray
    }

    func test() {
        print(fetchArrayData().count)
    }
}
