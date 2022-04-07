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

    var settingTheStyleForDifferentCells: Bool = false {
        didSet {
            settingTheStyleForDifferentCells ?
            settingCellForBigArray() :
            settingUpForOtherCells()
        }
    }
    let testView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.addSubview(activityIndicator)
        generalSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settingDataCell(data: ArrayCollectionModel) {
        label.text = data.title
    }

    func workStart() {
        label.text!.removeAll()
        activityIndicator.startAnimating()
        backgroundColor = .systemFill
    }

    func workFinish(title: String) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        label.text = title
        label.textColor = .black
        label.textAlignment = .center
        backgroundColor = .white
    }
}

// MARK: - Private extension for ArrayCollectionCell
private extension ArrayCollectionViewCell {

    func generalSettings() {
        backgroundColor = .systemGray4
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
