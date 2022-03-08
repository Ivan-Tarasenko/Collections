//
//  SetVC+Accessibility.swift
//  Collections
//
//  Created by Иван Тарасенко on 26.02.2022.
//

import Foundation

extension SetViewController {

    func setVCAccessibilityIdentificator() {
        firstView.accessibilityIdentifier = "FirstView"
        firstView.title.accessibilityIdentifier = "FirstView_Title"
        firstView.textField.accessibilityIdentifier = "FirstView_TextField"

        secondView.accessibilityIdentifier = "SecondView"
        secondView.title.accessibilityIdentifier = "SecondView_Title"
        secondView.textField.accessibilityIdentifier = "SecondView_TextField"

        allMatchButton.accessibilityIdentifier = "AllMatch_Button"
        allDoNotMatchButton.accessibilityIdentifier = "AllDoNotMatch_Button"
        uniqueCharacterButton.accessibilityIdentifier = "UniqueSymbols_Button"

        allMatchLabel.accessibilityIdentifier = "AllMatch_Label"
        allDoNotMatchLabel.accessibilityIdentifier = "AllDoNotMatch_Label"
        uniqueCharacterLabel.accessibilityIdentifier = "UniqueSymbols_Label"
    }
}
