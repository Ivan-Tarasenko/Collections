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
        indicator.frame = CGRect(
            x: bounds.midX - 20,
            y: bounds.midY - 20,
            width: 40,
            height: 40
        )
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return indicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.addSubview(activityIndicator)
        setDefaultCellStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settingDataCell(data: DictionaryCollectionModel) {
        label.text = data.title
        data.isPerfoming ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        label.isHidden = data.isPerfoming
        if data.isDone {
            backgroundColor = .white
            label.textColor = .black
        }
    }

    private func setDefaultCellStyle() {
        backgroundColor = .systemGray5
        layer.borderWidth = 0.5
        label.textColor = .systemBlue
    }
}
