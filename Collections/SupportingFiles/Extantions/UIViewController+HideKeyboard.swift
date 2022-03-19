//
//  UIViewController+HideKeyboard.swift
//  Collections
//
//  Created by Иван Тарасенко on 19.03.2022.
//

import Foundation
import UIKit

extension UIViewController {

    func hideKeyboard() {
        let endEditingTapRecognizer = UITapGestureRecognizer(
            target: view,
            action: #selector(UIView.endEditing)
        )
        view.addGestureRecognizer(endEditingTapRecognizer)
    }
}
