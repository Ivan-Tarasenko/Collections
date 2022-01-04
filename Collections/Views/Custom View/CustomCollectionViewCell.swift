//
//  CollectionViewCell.swift
//  Collections
//
//  Created by Иван Тарасенко on 28.12.2021.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {

   static let identifier = "CollectionCell"

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemBlue
        label.minimumScaleFactor = 0.4
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        return button
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalTo(contentView).inset(0)
        }

//        contentView.backgroundColor = .systemGray5
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(contentView).inset(10)
        }

        contentView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(contentView)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//    override var isSelected: Bool {
//        didSet {
//            if isSelected {
//                backgroundColor = .systemBlue
//            }
//        }
//    }
//
//    override var isHighlighted: Bool {
//           didSet {
//               if self.isHighlighted {
//                   backgroundColor = .green
//               } else {
//                   backgroundColor = .red
//               }
//           }
//       }

}

