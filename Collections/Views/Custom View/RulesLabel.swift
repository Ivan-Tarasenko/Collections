//
//  RulesLabel.swift
//  Collections
//
//  Created by Иван Тарасенко on 20.01.2022.
//

import UIKit

class RulesLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setLabel() {
        self.font = UIFont.systemFont(ofSize: 20)
        self.textColor = .systemBlue
        self.minimumScaleFactor = 0.5
        self.textAlignment = .center
        self.numberOfLines = 0
    }
}
