//
//  SetVC+Accessibility.swift
//  Collections
//
//  Created by Иван Тарасенко on 23.01.2022.
//

import Foundation

extension SetVC {

    func setVCAccessibilityIdentificator() {
        firstTextField.accessibilityIdentifier = "FirstTextField"
        firstTextField.title.accessibilityIdentifier = "FirstTextField_Title"
        firstTextField.textField.accessibilityIdentifier = "FirstTextField_TextField"

        secondTextField.accessibilityIdentifier = "SecondTextField"
        secondTextField.title.accessibilityIdentifier = "SecondTextField_Title"
        secondTextField.textField.accessibilityIdentifier = "SecondTextField_TextField"

        ruleAllMatchingLetters.accessibilityIdentifier = "AllMatch_Button"
        ruleAllCharacterDoNotMatch.accessibilityIdentifier = "AllDoNotMatch_Button"
        ruleUniqueSymbols.accessibilityIdentifier = "UniqueSymbols_Button"

        answerAllMatchingLetters.accessibilityIdentifier = "AllMatch_Label"
        answerAllCharacterDoNotMatch.accessibilityIdentifier = "AllDoNotMatch_Label"
        answerUniqueSymbols.accessibilityIdentifier = "UniqueSymbols_Label"
    }
}
