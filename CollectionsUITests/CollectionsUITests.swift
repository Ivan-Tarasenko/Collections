//
//  CollectionsUITests.swift
//  CollectionsUITests
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import XCTest

class CollectionsUITests: XCTestCase {

    let accessibility = SetVCAccessibilityIdentifier()

    var app: XCUIApplication!

    var firstTextField: XCUIElement!
    var firstTextFieldTitle: XCUIElement!
    var firstTextFieldTextField: XCUIElement!

    var secondTextField: XCUIElement!
    var secondTextFieldTitle: XCUIElement!
    var secondTextFieldTextField: XCUIElement!

    var ruleAllMatchingLetters: XCUIElement!
    var ruleAllCharacterDoNotMatch: XCUIElement!
    var ruleUniqueSymbols: XCUIElement!

    var answerAllMatchingLetters: XCUIElement!
    var answerAllCharacterDoNotMatch: XCUIElement!
    var answerUniqueSymbols: XCUIElement!

    var backBarButtonMavBar: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        firstTextField = app.otherElements[accessibility.firstTextField]
        firstTextFieldTitle = app.staticTexts[accessibility.firstTextFieldTitle]
        firstTextFieldTextField = app.textFields[accessibility.firstTextFieldTextField]

        secondTextField = app.otherElements[accessibility.secondTextField]
        secondTextFieldTitle = app.staticTexts[accessibility.secondTextFieldTitle]
        secondTextFieldTextField = app.textFields[accessibility.secondTextFieldTextField]

        ruleAllMatchingLetters = app.buttons[accessibility.ruleAllMatchingLetters]
        ruleAllCharacterDoNotMatch = app.buttons[accessibility.ruleAllCharacterDoNotMatch]
        ruleUniqueSymbols = app.buttons[accessibility.ruleUniqueSymbols]

        answerAllMatchingLetters = app.staticTexts[accessibility.answerAllMatchingLetters]
        answerAllCharacterDoNotMatch = app.staticTexts[accessibility.answerAllCharacterDoNotMatch]
        answerUniqueSymbols = app.staticTexts[accessibility.answerUniqueSymbols]

        backBarButtonMavBar = app.buttons[accessibility.backBarButtonMavBar
        ]
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        app.staticTexts["Set"].tap()

        XCTAssertTrue(firstTextField.exists)
        XCTAssertTrue(firstTextFieldTitle.exists)
        XCTAssertTrue(firstTextFieldTextField.exists)

        XCTAssertTrue(secondTextField.exists)
        XCTAssertTrue(secondTextFieldTitle.exists)
        XCTAssertTrue(secondTextFieldTextField.exists)

        XCTAssertTrue(ruleAllMatchingLetters.exists)
        XCTAssertTrue(ruleAllCharacterDoNotMatch.exists)
        XCTAssertTrue(ruleUniqueSymbols.exists)

        XCTAssertTrue(answerAllMatchingLetters.exists)
        XCTAssertTrue(answerAllCharacterDoNotMatch.exists)
        XCTAssertTrue(answerUniqueSymbols.exists)

        XCTAssertTrue(backBarButtonMavBar.exists)
    }

    func testOutputAnswer() throws {
        let stringOne = "Abcdefg"
        let stringTwo = "AbcdY"
        let answer = "Abcd"
        let answerTwo = "Yefg"
        let answerThree = "efg"
        app.staticTexts["Set"].tap()
        firstTextFieldTextField.tap()
        firstTextFieldTextField.typeText(stringOne)
        secondTextFieldTextField.tap()
        secondTextFieldTextField.typeText(stringTwo)
        ruleAllMatchingLetters.tap()
        ruleAllCharacterDoNotMatch.tap()
        ruleUniqueSymbols.tap()
        XCTAssertEqual(answerAllMatchingLetters.label, answer)
        XCTAssertEqual(answerAllCharacterDoNotMatch.label, answerTwo)
        XCTAssertEqual(answerUniqueSymbols.label, answerThree)
        backBarButtonMavBar.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
