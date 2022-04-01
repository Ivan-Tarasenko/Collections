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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
//        label.minimumScaleFactor = 0.5
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

    func createLabel() {


        if UIDevice.current.orientation.isLandscape {
            label.backgroundColor = .systemYellow
//            contentView.setNeedsDisplay()
//            label.frame = CGRect(
//                x: bounds.minX + 6,
//                y: bounds.minY + 6,
//                width: bounds.width - 12,
//                height: bounds.height - 12
//            )
        } else {
            label.backgroundColor = .blue
//            contentView.setNeedsLayout()
//            label.frame = CGRect(
//                x: bounds.minX + 6,
//                y: bounds.minY + 6,
//                width: bounds.width - 12,
//                height: bounds.height - 12
//            )
        }


        addSubview(label)

        label.widthAnchor.constraint(equalToConstant: bounds.width - 12).isActive = true
        label.heightAnchor.constraint(equalToConstant: bounds.height - 12).isActive = true


//            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true

        print("\(label.frame)")
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
