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
        label.font = UIFont.systemFont(ofSize: 12)
        label.minimumScaleFactor = 0.4
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .systemGreen
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(contentView).inset(5)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
