//
//  SetVC+HideKeyboard.swift
//  Collections
//
//  Created by Иван Тарасенко on 09.03.2022.
//

import UIKit

extension SetViewController {
    
    func hideKeyboard() {
        let endEditingTapRecognizer = UITapGestureRecognizer(
            target: view,
            action: #selector(UIView.endEditing)
        )
        view.addGestureRecognizer(endEditingTapRecognizer)
    }
}
