//
//  SetVC.swift
//  Collections
//
//  Created by Иван Тарасенко on 23.12.2021.
//

import UIKit
import SnapKit

class SetVC: UIViewController {

    private var firstTextField = CustomView()
    private var secondTextField = CustomView()
    private var ruleAllMatchingLetters = RulesLabel()
    private var ruleAllCharacterDoNotMatch = RulesLabel()
    private var ruleUniqueSymbols = RulesLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        createFirstTextField()
        createSecondTextField()
        createLabelRuleAllMatchingLetter()
        createLabelRuleAllCharacterDoNotMatch()
        createLabelRuleUniqueSymbols()
    }

    func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .white
    }

    func createFirstTextField() {
        firstTextField.settingView(type: .noDigits)
        firstTextField.title.textTitle.removeAll()
        view.addSubview(firstTextField)
        firstTextField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.size.width - 20, height: 66))
            make.leading.trailing.equalTo(view).inset(20)
            make.top.equalTo(view).inset(120)
        }
    }

    func createSecondTextField() {
        secondTextField.settingView(type: .noDigits)
        secondTextField.title.textTitle.removeAll()
        view.addSubview(secondTextField)
        secondTextField.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.size.width - 20, height: 66))
            make.leading.trailing.equalTo(view).inset(20)
            make.top.equalTo(firstTextField).inset(80)
        }
    }

    func createLabelRuleAllMatchingLetter() {
        ruleAllMatchingLetters.textTitle = "All matching letter"
        view.addSubview(ruleAllMatchingLetters)
        ruleAllMatchingLetters.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.size.width - 20, height: 40))
            make.top.equalTo(secondTextField).inset(100)
            make.trailing.leading.equalTo(view).inset(20)
        }
    }

    func createLabelRuleAllCharacterDoNotMatch() {
        ruleAllCharacterDoNotMatch.textTitle = "All characters that don't match"
        view.addSubview(ruleAllCharacterDoNotMatch)
        ruleAllCharacterDoNotMatch.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.size.width - 20, height: 40))
            make.top.equalTo(ruleAllMatchingLetters).inset(100)
            make.trailing.leading.equalTo(view).inset(20)
        }
    }

    func createLabelRuleUniqueSymbols() {
        ruleUniqueSymbols.textTitle = "All unique characters from the first text field that don't match in text fields"
        view.addSubview(ruleUniqueSymbols)
        ruleUniqueSymbols.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: view.frame.size.width - 20, height: 70))
            make.top.equalTo(ruleAllCharacterDoNotMatch).inset(100)
            make.trailing.leading.equalTo(view).inset(20)
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
