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
        label.frame = CGRect(
            x: bounds.minX + 6,
            y: bounds.minY,
            width: bounds.width - 6,
            height: bounds.height
        )
        label.numberOfLines = 0
        label.textAlignment = .center
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return label
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()

    var settingTheStyleForDifferentCells: Bool = false {
        didSet {
            settingTheStyleForDifferentCells ?
            settingCellForBigArray() :
            settingUpForOtherCells()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        generalSettingCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settingDataCell(data: DictionaryCollectionModel) {
        label.text = data.title
    }
}

private extension DictionaryCollectionViewCell {

    func generalSettingCell() {
        backgroundColor = .systemGray5
        layer.borderWidth = 0.5
    }

    func settingCellForBigArray() {
        label.textColor = .systemBlue
        label.textAlignment = .center
    }

    func settingUpForOtherCells() {
        label.textColor = .systemBlue
    }
}
