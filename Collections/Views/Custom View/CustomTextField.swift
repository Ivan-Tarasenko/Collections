//
//  CustomTextField.swift
//  Collections
//
//  Created by Иван Тарасенко on 15.01.2022.
//

import UIKit

class CustomTextField: UIView {

    @IBOutlet var view: CustomTextField!
    @IBOutlet weak var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initXib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        initXib()
    }

    func initXib() {
        Bundle.main.loadNibNamed("CustomTextField", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.frame
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

}
