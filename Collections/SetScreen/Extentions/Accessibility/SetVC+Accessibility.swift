//
//  SetVC+Accessibility.swift
//  Collections
//
//  Created by Иван Тарасенко on 26.02.2022.
//

import Foundation

extension SetViewController {

    func setVCAccessibilityIdentificator() {
        firstView.accessibilityIdentifier = "FirstView_SetScreen"
        firstView.title.accessibilityIdentifier = "FirstViewTitle_SetScreen"
        firstView.textField.accessibilityIdentifier = "FirstViewTextField_SetScreen"

        secondView.accessibilityIdentifier = "SecondView_SetScreen"
        secondView.title.accessibilityIdentifier = "SecondViewTitle_SetScreen"
        secondView.textField.accessibilityIdentifier = "SecondViewTextField_SetScreen"

        allMatchButton.accessibilityIdentifier = "AllMatchButton_SetScreen"
        allDoNotMatchButton.accessibilityIdentifier = "AllDoNotMatchButton_SetScreen"
        uniqueCharacterButton.accessibilityIdentifier = "UniqueSymbolsButton_SetScreen"

        allMatchLabel.accessibilityIdentifier = "AllMatchLabel_SetScreen"
        allDoNotMatchLabel.accessibilityIdentifier = "AllDoNotMatchLabel_SetScreen"
        uniqueCharacterLabel.accessibilityIdentifier = "UniqueSymbolsLabel_SetScreen"
    }
}
