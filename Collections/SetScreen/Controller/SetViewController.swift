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

    let viewModel = SetViewModel()

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

        let answerAllMatch = viewModel.answerMatchingletter(first: firstString, second: secondString)
        let answerAllDoNotMatch = viewModel.answerDoNotMatchLetter(first: firstString, second: secondString)
        let answerUniqueCharacter = viewModel.answerCharacterDifference(first: firstString, second: secondString)
       
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
        allMatchButton.setTitle(viewModel.titleAllMatch, for: .normal)
        allDoNotMatchButton.setTitle(viewModel.titleAllDoNotMatch, for: .normal)
        uniqueCharacterButton.setTitle(viewModel.titleUniqueButton, for: .normal)
    }
}

extension SetViewController {

    func hideKeyboard() {
        let endEditingTapRecognizer = UITapGestureRecognizer(
            target: view,
            action: #selector(UIView.endEditing)
        )
        view.addGestureRecognizer(endEditingTapRecognizer)
    }
}
