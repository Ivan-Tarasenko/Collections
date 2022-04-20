//
//  LoadingView.swift
//  Collections
//
//  Created by Иван Тарасенко on 20.04.2022.
//

import UIKit

class LoadingView: UIView {

    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(
            x: bounds.midX,
            y: bounds.midY,
            width: bounds.width / 2,
            height: 40
                )
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return indicator
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .systemGray6
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
