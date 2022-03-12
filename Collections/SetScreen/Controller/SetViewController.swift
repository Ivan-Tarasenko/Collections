//
//  SetViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 22.02.2022.
//

import UIKit

class SetViewController: UIViewController {

    @IBOutlet weak var firstView: CustomView!
    @IBOutlet weak var secondView: CustomView!

    @IBOutlet weak var allMatchButton: UIButton!
    @IBOutlet weak var allDoNotMatchButton: UIButton!
    @IBOutlet weak var uniqueCharacterButton: UIButton!

    @IBOutlet weak var allMatchLabel: UILabel!
    @IBOutlet weak var allDoNotMatchLabel: UILabel!
    @IBOutlet weak var uniqueCharacterLabel: UILabel!

    let setModel = SetViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingViews()
        settingTitleButton()
        hideKeyboard()
        setVCAccessibilityIdentificator()
    }

    @IBAction func pressButton(_ sender: UIButton) {
        let firstString = firstView.textField.string
        let secondString = secondView.textField.string

        let answerAllMatch = setModel.answerMatchingletter(first: firstString, second: secondString)
        let answerAllDoNotMatch = setModel.answerDoNotMatchLetter(first: firstString, second: secondString)
        let answerUniqueCharacter = setModel.answerCharacterDifference(first: firstString, second: secondString)
       
        switch sender.tag {
        case 0:
           allMatchLabel.textTitle = answerAllMatch
        case 1:
           allDoNotMatchLabel.textTitle = answerAllDoNotMatch
        case 2:
            uniqueCharacterLabel.textTitle = answerUniqueCharacter
        default:
            break
        }

    }

    func settingViews() {
        let nameFirstView = "First Text Field"
        let nameSecondView = "Second Text Field"
        firstView.settingView(type: .noDigits)
        secondView.settingView(type: .noDigits)
        firstView.title.textTitle = nameFirstView
        secondView.title.textTitle = nameSecondView
    }

    func settingTitleButton() {
        uniqueCharacterButton.titleLabel?.numberOfLines = 0
        uniqueCharacterButton.titleLabel?.textAlignment = .center
        allMatchButton.setTitle(setModel.titleAllMatch, for: .normal)
        allDoNotMatchButton.setTitle(setModel.titleAllDoNotMatch, for: .normal)
        uniqueCharacterButton.setTitle(setModel.titleUniqueButton, for: .normal)
    }
}
