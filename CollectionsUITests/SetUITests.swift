//
//  SetUITests.swift
//  CollectionsUITests
//
//  Created by Иван Тарасенко on 26.02.2022.
//
import XCTest

class SetUITests: XCTestCase {

    let accessibility = SetVCAccessibilityIdentifier()

    var app: XCUIApplication!

    var setCell: XCUIElement!

    var firstView: XCUIElement!
    var firstViewTitle: XCUIElement!
    var firstViewTextField: XCUIElement!

    var secondView: XCUIElement!
    var secondViewTitle: XCUIElement!
    var secondViewTextField: XCUIElement!

    var allMatchButton: XCUIElement!
    var allDoNotMatchButton: XCUIElement!
    var uniqueCharacterButton: XCUIElement!

    var allMatchLabel: XCUIElement!
    var allDoNotMatchLabel: XCUIElement!
    var uniqueCharacterLabel: XCUIElement!

    var backBarButtonMavBar: XCUIElement!
    var returnButton: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        setCell = app.cells.element(boundBy: 1)

        firstView = app.otherElements[accessibility.firstView]
        firstViewTitle = app.staticTexts[accessibility.firstViewTitle]
        firstViewTextField = app.textFields[accessibility.firstViewTextField]

        secondView = app.otherElements[accessibility.secondView]
        secondViewTitle = app.staticTexts[accessibility.secondViewTitle]
        secondViewTextField = app.textFields[accessibility.secondViewTextField]

        allMatchButton = app.buttons[accessibility.allMatchButton]
        allDoNotMatchButton = app.buttons[accessibility.allDoNotMatchButton]
        uniqueCharacterButton = app.buttons[accessibility.uniqueCharacterButton]

        allMatchLabel = app.staticTexts[accessibility.allMatchLabel]
        allDoNotMatchLabel = app.staticTexts[accessibility.allDoNotMatchLabel]
        uniqueCharacterLabel = app.staticTexts[accessibility.uniqueCharacterLabel]

        backBarButtonMavBar = app.navigationBars.element(boundBy: 0)
        returnButton = app.buttons[accessibility.returnBotton]
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        setCell.tap()

        XCTAssertTrue(firstView.exists)
        XCTAssertTrue(firstViewTitle.exists)
        XCTAssertTrue(firstViewTextField.exists)

        XCTAssertTrue(secondView.exists)
        XCTAssertTrue(secondViewTitle.exists)
        XCTAssertTrue(secondViewTextField.exists)

        XCTAssertTrue(allMatchButton.exists)
        XCTAssertTrue(allDoNotMatchButton.exists)
        XCTAssertTrue(uniqueCharacterButton.exists)

        XCTAssertTrue(allMatchLabel.exists)
        XCTAssertTrue(allDoNotMatchLabel.exists)
        XCTAssertTrue(uniqueCharacterLabel.exists)

        XCTAssertTrue(backBarButtonMavBar.exists)
    }

    func testOutputAnswer() throws {
        let firstString = "Abcdefg"
        let secondString = "AbcdY"
        let answer = "Abcd"
        let answerSecond = "Yefg"
        let answerThird = "efg"
        setCell.tap()
        firstViewTextField.tap()
        firstViewTextField.typeText(firstString)
        secondViewTextField.tap()
        secondViewTextField.typeText(secondString)
        returnButton.tap()
        allMatchButton.tap()
        allDoNotMatchButton.tap()
        uniqueCharacterButton.tap()
        XCTAssertEqual(allMatchLabel.label, answer)
        XCTAssertEqual(allDoNotMatchLabel.label, answerSecond)
        XCTAssertEqual(uniqueCharacterLabel.label, answerThird)
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
