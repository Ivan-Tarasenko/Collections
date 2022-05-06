//
//  CustomPasswordValidation.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 22.11.2021.
//

import UIKit

class CustomPassValid {

    var minLengthChar = UILabel()
    var minOneDigit = UILabel()
    var minOneLowercase = UILabel()
    var minCapitalRequired = UILabel()
    var notSpecialChar = UILabel()
    var onlyEnglishChar = UILabel()

    var progressView = UIProgressView()

    let localizing = Localization()

    var switchForMinChar: Bool = false {
        didSet {
            if switchForMinChar {
                progressView.progress += 0.25
                minLengthChar.textColor = .systemGreen
                minLengthChar.textTitle =
                localizing.minChar.replacingOccurrences(of: "-", with: "✓")
            } else {
                minLengthChar.textColor = .black
                minLengthChar.textTitle =
                localizing.minChar.replacingOccurrences(of: "✓", with: "-")
            }
        }
    }

    var switchForMinOneDigit: Bool = false {
        didSet {
            if switchForMinOneDigit {
                progressView.progress += 0.25
                minOneDigit.textColor = .systemGreen
                minOneDigit.textTitle =
                localizing.minOneDigit.replacingOccurrences(of: "-", with: "✓")
            } else {
                minOneDigit.textColor = .black
                minOneDigit.textTitle =
                localizing.minOneDigit.replacingOccurrences(of: "✓", with: "-")
            }
        }
    }

    var switchForMinOneLowercase: Bool = false {
        didSet {
            if switchForMinOneLowercase {
                progressView.progress += 0.25
                minOneLowercase.textColor = .systemGreen
                minOneLowercase.textTitle =
                localizing.minOneLowercase.replacingOccurrences(of: "-", with: "✓")
            } else {
                minOneLowercase.textColor = .black
                minOneLowercase.textTitle =
                localizing.minOneLowercase.replacingOccurrences(of: "✓", with: "-")
            }
        }
    }

    var switchForMinCapitalRequired: Bool = false {
        didSet {
            if switchForMinCapitalRequired {
                progressView.progress += 0.25
                minCapitalRequired.textColor = .systemGreen
                minCapitalRequired.textTitle =
                localizing.minOneCapitalRequired.replacingOccurrences(of: "-", with: "✓")
            } else {
                minCapitalRequired.textColor = .black
                minCapitalRequired.textTitle =
                localizing.minOneCapitalRequired.replacingOccurrences(of: "✓", with: "-")
            }
        }
    }

    var showLabelForPasswordValidation: Bool = true {
        didSet {
            if showLabelForPasswordValidation {
                minLengthChar.isHidden = true
                minOneDigit.isHidden = true
                minOneLowercase.isHidden = true
                minCapitalRequired.isHidden = true
                notSpecialChar.isHidden = true
                onlyEnglishChar.isHidden = true
            } else {
                minLengthChar.isHidden = false
                minOneDigit.isHidden = false
                minOneLowercase.isHidden = false
                minCapitalRequired.isHidden = false
            }
        }
    }

    var showLabelForbiddenChar: Bool = true {
        didSet {
            if showLabelForbiddenChar {
                notSpecialChar.isHidden = true
                onlyEnglishChar.isHidden = true
            } else {
                notSpecialChar.isHidden = false
                onlyEnglishChar.isHidden = false
            }
        }
    }

    func setLabelPasswordValidation () {

        let labelFont = UIFont.systemFont(ofSize: 13)

        minLengthChar.font = labelFont
        minLengthChar.textTitle = localizing.minChar

        minOneDigit.font = labelFont
        minOneDigit.textTitle = localizing.minOneDigit

        minOneLowercase.font = labelFont
        minOneLowercase.textTitle = localizing.minOneLowercase

        minCapitalRequired.font = labelFont
        minCapitalRequired.textTitle = localizing.minOneCapitalRequired

        notSpecialChar.font = labelFont
        notSpecialChar.textTitle = localizing.notSpecialChar
        notSpecialChar.textColor = .systemRed

        onlyEnglishChar.font = labelFont
        onlyEnglishChar.textTitle = localizing.onlyEnglishChar
        onlyEnglishChar.textColor = .systemRed
    }
}
