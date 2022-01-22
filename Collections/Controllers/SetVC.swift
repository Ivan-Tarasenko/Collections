//
//  SetVC.swift
//  Collections
//
//  Created by Иван Тарасенко on 23.12.2021.
//

import UIKit
import SnapKit

class SetVC: UIViewController {

    let model = Model()

    private var firstTextField = CustomView()
    private var secondTextField = CustomView()

    private var ruleAllMatchingLetters = RulesButton()
    private var ruleAllCharacterDoNotMatch = RulesButton()
    private var ruleUniqueSymbols = RulesButton()

    private var answerAllMatchingLetters = AnswerLabel()
    private var answerAllCharacterDoNotMatch = AnswerLabel()
    private var answerUniqueSymbols = AnswerLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        createFirstTextField()
        createAllButtonAnswer()
        createAllAnswerLabel()
    }

    @objc func buttonPress(sender: UIButton!) {
        let stringOne = firstTextField.textField.string
        let stringTwo = secondTextField.textField.string

        switch sender.tag {
        case 1:
            answerAllMatchingLetters.textTitle =
            model.answerMatchingletter(stringOne: stringOne, stringTwo: stringTwo)
        case 2:
            answerAllCharacterDoNotMatch.textTitle =
            model.answerDoNotMatchLetter(stringOne: stringOne, stringTwo: stringTwo)
        case 3:
            answerUniqueSymbols.textTitle =
            model.answerCharacterDifference(stringOne: stringOne, stringTwo: stringTwo)
        default:
            break
        }
    }

    func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .white
    }

    // MARK: - Add text field.
    func createFirstTextField() {
        let widthUIElements: CGFloat = view.frame.size.width - 20
        let heightUIElements: CGFloat = 66
        firstTextField.settingView(type: .noDigits)
        firstTextField.title.textTitle.removeAll()
        view.addSubview(firstTextField)
        firstTextField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: widthUIElements, height: heightUIElements))
            make.leading.trailing.equalTo(view).inset(20)
            make.top.equalTo(view).inset(120)
        }

        secondTextField.settingView(type: .noDigits)
        secondTextField.title.textTitle.removeAll()
        view.addSubview(secondTextField)
        secondTextField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: widthUIElements, height: heightUIElements))
            make.leading.trailing.equalTo(view).inset(20)
            make.top.equalTo(firstTextField).inset(80)
        }
    }

    // MARK: - Add button answer.
    func createAllButtonAnswer() {
        let widthUIElements: CGFloat = view.frame.size.width - 20
        ruleAllMatchingLetters.setTitle(model.titleAllMatching, for: .normal)
        ruleAllMatchingLetters.tag = 1
        ruleAllMatchingLetters.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        view.addSubview(ruleAllMatchingLetters)
        ruleAllMatchingLetters.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: widthUIElements, height: 40))
            make.top.equalTo(secondTextField).inset(100)
            make.trailing.leading.equalTo(view).inset(20)
        }

        ruleAllCharacterDoNotMatch.setTitle(model.titleAllCharacterDoNotMatch, for: .normal)
        ruleAllCharacterDoNotMatch.tag = 2
        ruleAllCharacterDoNotMatch.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        view.addSubview(ruleAllCharacterDoNotMatch)
        ruleAllCharacterDoNotMatch.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: widthUIElements, height: 40))
            make.top.equalTo(ruleAllMatchingLetters).inset(100)
            make.trailing.leading.equalTo(view).inset(20)
        }

        ruleUniqueSymbols.setTitle(model.titleUniqueSymbols, for: .normal)
        ruleUniqueSymbols.tag = 3
        ruleUniqueSymbols.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        view.addSubview(ruleUniqueSymbols)
        ruleUniqueSymbols.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: widthUIElements, height: 70))
            make.top.equalTo(ruleAllCharacterDoNotMatch).inset(100)
            make.trailing.leading.equalTo(view).inset(20)
        }
    }

    // MARK: - Add answer label.
    func createAllAnswerLabel() {
        let height: CGFloat = 50
        let widthUIElements: CGFloat = view.frame.size.width - 20
        view.addSubview(answerAllMatchingLetters)
        answerAllMatchingLetters.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: widthUIElements, height: height))
            make.trailing.leading.equalTo(view).inset(20)
            make.top.equalTo(ruleAllMatchingLetters).inset(30)
        }

        view.addSubview(answerAllCharacterDoNotMatch)
        answerAllCharacterDoNotMatch.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: widthUIElements, height: height))
            make.trailing.leading.equalTo(view).inset(20)
            make.top.equalTo(ruleAllCharacterDoNotMatch).inset(30)
        }

        view.addSubview(answerUniqueSymbols)
        answerUniqueSymbols.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: widthUIElements, height: height))
            make.trailing.leading.equalTo(view).inset(20)
            make.top.equalTo(ruleUniqueSymbols).inset(57)
        }
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
