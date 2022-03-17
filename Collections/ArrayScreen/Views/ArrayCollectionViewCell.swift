//
//  ArrayCollectionViewCell.swift
//  Collections
//
//  Created by Иван Тарасенко on 03.03.2022.
//

import UIKit

class ArrayCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }

    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)
        createLabel()
        createActivityIndicator()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setArrayCell(data: ArrayCollectionViewData) {
        label.textTitle = data.title
    }

    private func createLabel() {
        label.frame = CGRect(
            x: bounds.minX + 6,
            y: bounds.minY,
            width: bounds.width - 6,
            height: bounds.height
        )
        addSubview(label)
    }

    private func createActivityIndicator() {
        activityIndicator.frame = CGRect(
            x: bounds.minX,
            y: bounds.minY,
            width: bounds.width,
            height: bounds.height
        )
        addSubview(activityIndicator)
    }
}
