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
        label.frame = CGRect(
            x: contentView.bounds.minX + 6,
            y: contentView.bounds.minY,
            width: contentView.bounds.width - 12,
            height: contentView.bounds.height
        )
        label.numberOfLines = 0
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return label
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(
            x: contentView.bounds.minX,
            y: contentView.bounds.minY,
            width: contentView.bounds.width,
            height: contentView.bounds.height
        )
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return indicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        label.textAlignment = .center
        label.textColor = .systemBlue
        contentView.addSubview(label)
        contentView.addSubview(activityIndicator)
        generalSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settingDataCell(data: ArrayCollectionModel) {
        label.text = data.title
        data.isPerfoming ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        label.isHidden = data.isPerfoming

        if data.isDone {
            backgroundColor = .white
            label.textColor = .black
        }

        if activityIndicator.isAnimating {
            backgroundColor = .systemFill

        }
    }

    func settingLabelForBigArray() {
        label.textAlignment = .center
    }

    private func generalSettings() {
        backgroundColor = .systemGray4
        layer.borderWidth = 0.5
    }
}
