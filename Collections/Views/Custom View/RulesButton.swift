//
//  RulesButton.swift
//  Collections
//
//  Created by Иван Тарасенко on 20.01.2022.
//

import UIKit

class RulesButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setLabel() {
        self.setTitleColor(.systemBlue, for: .normal)
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.textAlignment = .center
    }
}
