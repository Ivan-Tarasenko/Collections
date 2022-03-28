//
//  HeaderDictionary.swift
//  Collections
//
//  Created by Иван Тарасенко on 27.03.2022.
//

import UIKit

class HeaderDictionary: UICollectionReusableView {

    @IBOutlet weak var headerArray: UILabel!
    @IBOutlet weak var headerDictionary: UILabel!

    func setHeaderArray() {
        headerArray.text = "Array"
    }

    func setHeaderDictionary() {
        headerDictionary.text = "Dictionary"
    }

}
