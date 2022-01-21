//
//  AnswerLabel.swift
//  Collections
//
//  Created by Иван Тарасенко on 20.01.2022.
//

import UIKit

class AnswerLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setAnswerLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setAnswerLabel() {
        self.font = UIFont.systemFont(ofSize: 25)
        self.numberOfLines = 0
        self.textAlignment = .center
    }
}
