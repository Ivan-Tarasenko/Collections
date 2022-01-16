//
//  CustomView.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 19.09.2021.
//

import UIKit
import SnapKit

class CustomView: UIView {
    
    @IBOutlet var xibView: CustomView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var limitLabel: UILabel!
    
    var switchTextField: TextFields = .noDigits
    let model = TextFieldModel()

    private var tuneBorderForTextField: Bool = false {
        didSet {
            tuneBorderForTextField ?
            textField.setBorder(radius: 10, color: UIColor.systemBlue) :
            textField.setBorder(radius: 10, color: UIColor.systemGray6)
            
        }
    }
    
    private var tuneBorderFromFieldLimitChar: Bool = false {
        didSet {
            tuneBorderFromFieldLimitChar ?
            textField.setBorder(radius: 10, color: UIColor.systemRed) :
            textField.setBorder(radius: 10, color: UIColor.systemBlue)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        textField.delegate = self

    }
    
    // MARK: - Action for textField connected as editing changed
    @IBAction func actionTextField(_ sender: UITextField) {
        let text = sender.string
        
        switch switchTextField {
            //  - Rules for limit character and change border
        case .inputLimit:
            limitLabel.textTitle = model.getLimit(string: text, limit: model.limitChar)
            if text.count > model.limitChar {
                tuneBorderFromFieldLimitChar = true
            } else {
                tuneBorderFromFieldLimitChar = false
            }
            sender.attributedText = model.changeColorAfterLimit(string: sender.string)
            
        case .onlyCharacters:
            //  - Add character "-"
            if !model.addSeparator, text.count == model.separatorIndex {
                sender.string.append(model.separator)
            }
        default:
            break
        }
    }
    // MARK: - Configure CustomView
    func configureView() {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        xibView.frame = self.bounds
        self.addSubview(xibView)
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    }
    // MARK: - Setting CustomView
    func settingView(type: TextFields) {
        switchTextField = type
        configureTextFields()
    }

    // MARK: - configuration of individual views.
    func configureTextFields() {
        switch switchTextField {
        case .noDigits:
            textField.setDefaultBorder()
            title.textTitle = "No Digit"
            textField.placeholder = "type here"
        case .inputLimit:
            limitLabel.textTitle = "\(model.limitChar)/\(model.limitChar)"
            textField.setDefaultBorder()
            title.textTitle = "Limit Char"
            textField.placeholder = "Type here"
        case .onlyCharacters:
            textField.setDefaultBorder()
            title.textTitle = "Only Char"
            textField.placeholder = "Type here"
            textField.autocapitalizationType = .words
        case .link:
            textField.setDefaultBorder()
            title.textTitle = "Link"
            textField.placeholder = "Link here"
        default:
            break
        }
    }
}
extension CustomView: UITextFieldDelegate {
    
    // MARK: - Perform reverse by button "Return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if switchTextField == .link {
            model.linkUrl(url: model.detectedLink(string: textField.string))
        }
        self.endEditing(true)
        return false
    }
    
    // MARK: - Input tracking
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tuneBorderForTextField = true

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if switchTextField == .link {
            guard !textField.string.isEmpty else { return }
            textField.string = model.detectedLink(string: textField.string)
        }
    }
    // MARK: - Working with regular expressions.
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String
    ) -> Bool {
        switch switchTextField {
        case .noDigits:
            return model.noDigit(string: string)
        case .onlyCharacters:
            return model.validCharacter(text: textField.string + string,
                                        replacement: string
            )
        default:
            break
        }
        return true
    }
}
