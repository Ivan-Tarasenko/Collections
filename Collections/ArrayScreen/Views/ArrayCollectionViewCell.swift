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

    var settingTheStyleForDifferentCells: Bool = false {
        didSet {
            settingTheStyleForDifferentCells ?
            settingCellForBigArray() :
            settingUpForOtherCells()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        createLabel()
        createActivityIndicator()
        generalSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settingDataCell(data: ArrayCollectionModel) {
        label.text = data.title
    }

    func cellStart() {
        label.text!.removeAll()
        activityIndicator.startAnimating()
    }

    func cellFinish(title: String) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        label.text = title
        label.textColor = .black
        backgroundColor = .white
    }
}

// MARK: - Private extension for ArrayCollectionCell
private extension ArrayCollectionViewCell {

    func createLabel() {
        label.frame = CGRect(
            x: bounds.minX + 6,
            y: bounds.minY,
            width: bounds.width - 6,
            height: bounds.height
        )
        addSubview(label)
    }

    func createActivityIndicator() {
        activityIndicator.frame = CGRect(
            x: bounds.minX,
            y: bounds.minY,
            width: bounds.width,
            height: bounds.height
        )
        addSubview(activityIndicator)
    }

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
