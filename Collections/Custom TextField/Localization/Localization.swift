//
//  Localization.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 26.11.2021.
//
import UIKit

class Localization {

    // Localization title.
    let titleLabelAll = NSLocalizedString("Text_Fields_All", comment: "")
    let titleLabelNoDigit = NSLocalizedString("Text_Fields_NoDigit", comment: "")
    let titleLabelLimit = NSLocalizedString("Text_Fields_LimitChar", comment: "")
    let titleLabelOnlyChar = NSLocalizedString("Text_Fields_OnlyChar", comment: "")
    let titleLabelLink = NSLocalizedString("Text_Fields_Link", comment: "")
    let titleLabelPass = NSLocalizedString("Text_Fields_Password", comment: "")

    // Localization Text Fields.
    let noDigit = NSLocalizedString("NO_Digits_field", comment: "")
    let noDigitPlaceholder = NSLocalizedString("Type_here", comment: "")

    let limitCharTitle = NSLocalizedString("Input_limit", comment: "")
    let limitCharPlaceholder = NSLocalizedString("Type_here", comment: "")

    let onlyChar = NSLocalizedString("Only_characters", comment: "")
    let onlyCharPlaceholder = NSLocalizedString("wwwww_ddddd", comment: "")

    let link = NSLocalizedString("Link", comment: "")
    let linkPlaceholder = NSLocalizedString("www.example.com", comment: "")

    let password = NSLocalizedString("Validation_rules", comment: "")
    let passwordPlaceholder = NSLocalizedString("Password", comment: "")

    // Localization label password validation.
    let minChar = NSLocalizedString("Min_length_characters", comment: "")
    let minOneDigit = NSLocalizedString("Min_1_digit", comment: "")
    let minOneLowercase = NSLocalizedString("Min_1_lowercase", comment: "")
    let minOneCapitalRequired = NSLocalizedString("Min_1_capital_required", comment: "")
    let notSpecialChar = NSLocalizedString("special_characters_are_not_allowed", comment: "")
    let onlyEnglishChar = NSLocalizedString("only_English_characters", comment: "")
}
