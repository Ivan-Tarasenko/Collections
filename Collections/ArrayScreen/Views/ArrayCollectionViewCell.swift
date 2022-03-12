//
//  ArrayCollectionViewCell.swift
//  Collections
//
//  Created by Иван Тарасенко on 03.03.2022.
//

import UIKit

class ArrayCollectionViewCell: UICollectionViewCell {

    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    static var identifier: String {
        return String(describing: self)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        label.frame = CGRect(x: bounds.minX + 6,
                             y: bounds.minY,
                             width: bounds.width - 6,
                             height: bounds.height
        )
        
        addSubview(label)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setArrayCell(data: ArrayCollectionViewData) {
        label.textTitle = data.nameCell
    }
}
