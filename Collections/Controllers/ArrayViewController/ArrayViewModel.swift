//
//  ArrayViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 09.03.2022.
//

import Foundation

class ExtractionNameForCollectionCell {

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

    var nameCell = [CollectionViewName]()

    func getNameCollectionView() {
        nameCell = [CollectionViewName(nameCell: insertBeginOnce),
                    CollectionViewName(nameCell: insertBeginOneTime),
                    CollectionViewName(nameCell: insertMiddleOnce),
                    CollectionViewName(nameCell: insertMiddleOneTime),
                    CollectionViewName(nameCell: insertTheEndOnce),
                    CollectionViewName(nameCell: insertTheEndOneTime),
                    CollectionViewName(nameCell: removeBeginOnce),
                    CollectionViewName(nameCell: removeBeginOneTime),
                    CollectionViewName(nameCell: removeMiddleOnce),
                    CollectionViewName(nameCell: removeMiddleOneTime),
                    CollectionViewName(nameCell: removeTheEndOnce),
                    CollectionViewName(nameCell: removeTheEndOneTime)
        ]
    }

}
