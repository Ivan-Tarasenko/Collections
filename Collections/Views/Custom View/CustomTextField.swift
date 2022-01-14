//
//  CustomTextField.swift
//  Collections
//
//  Created by Иван Тарасенко on 10.01.2022.
//

import UIKit

class CustomTextField: UIView {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textField: UITextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    // MARK: - Configure CustomView
    func configureView() {
        guard let view = loadViewFromNib(nibName: "CustomTextField") else { return }
        view.frame = bounds
        addSubview(view)
    }

}
