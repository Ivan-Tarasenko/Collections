//
//  ArrayViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 09.03.2022.
//

import Foundation

class ArrayViewModel {

    var bigArray = [Int]()
    
    let titleBigArray = NSLocalizedString("titleBigArray", comment: "")

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

    var dataArray = [ArrayCollectionViewData]()

    func fetchArrayData() {
        dataArray = [ArrayCollectionViewData(nameCell: insertBeginOnce),
                    ArrayCollectionViewData(nameCell: insertBeginOneTime),
                    ArrayCollectionViewData(nameCell: insertMiddleOnce),
                    ArrayCollectionViewData(nameCell: insertMiddleOneTime),
                    ArrayCollectionViewData(nameCell: insertTheEndOnce),
                    ArrayCollectionViewData(nameCell: insertTheEndOneTime),
                    ArrayCollectionViewData(nameCell: removeBeginOnce),
                    ArrayCollectionViewData(nameCell: removeBeginOneTime),
                    ArrayCollectionViewData(nameCell: removeMiddleOnce),
                    ArrayCollectionViewData(nameCell: removeMiddleOneTime),
                    ArrayCollectionViewData(nameCell: removeTheEndOnce),
                    ArrayCollectionViewData(nameCell: removeTheEndOneTime)
        ]
    }

//    func getBigArray() -> [Int] {
//        return Array(0...9_999)
//    }
}
