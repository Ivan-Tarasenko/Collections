//
//  DictionaryCollectionViewCell.swift
//  Collections
//
//  Created by Иван Тарасенко on 11.03.2022.
//

import UIKit

class DictionaryCollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        return String(describing: self)
    }

    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.3
        label.textAlignment = .center
        label.text = "test"
        return label
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        generalSettingCell()
        createLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension DictionaryCollectionViewCell {

    func generalSettingCell() {
        backgroundColor = .systemGray4
        layer.borderWidth = 0.5

    }

    func createLabel() {
        addSubview(label)
        
        label.frame = CGRect(
            x: bounds.minX + 6,
            y: bounds.minY,
            width: bounds.width - 6,
            height: bounds.height
        )
    }
}
