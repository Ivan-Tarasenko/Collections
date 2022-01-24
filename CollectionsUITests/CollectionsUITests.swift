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

    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

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
