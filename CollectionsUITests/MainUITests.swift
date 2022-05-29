//
//  MainUITests.swift
//  CollectionsUITests
//
//  Created by Иван Тарасенко on 02.05.2022.
//

import XCTest

class MainUITests: XCTestCase {

    var app: XCUIApplication!
    var arrayCell: XCUIElement!
    var setCell: XCUIElement!
    var dictionaryCell: XCUIElement!
    var backButtonNavBar: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        arrayCell = app.cells.element(boundBy: 0)
        setCell = app.cells.element(boundBy: 1)
        dictionaryCell = app.cells.element(boundBy: 2)
        backButtonNavBar = app.navigationBars.buttons.element(boundBy: 0)
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        XCTAssertTrue(arrayCell.exists)
        XCTAssertTrue(setCell.exists)
        XCTAssertTrue(dictionaryCell.exists)
    }

    func testOfSwitchingToOtherScreensAndAbout() throws {
        XCTAssertTrue(isOnMainView)
        arrayCell.tap()
        XCTAssertTrue(inOnArrayView)
        backButtonNavBar.tap()
        setCell.tap()
        XCTAssertTrue(inOnSetView)
        backButtonNavBar.tap()
        dictionaryCell.tap()
        XCTAssertTrue(inOnDictionary)
        backButtonNavBar.tap()

    }
}

extension MainUITests {

    var isOnMainView: Bool {
        return app.otherElements["MainView"].exists
    }

    var inOnArrayView: Bool {
        return app.otherElements["ArrayView"].exists
    }

    var inOnSetView: Bool {
        return app.otherElements["SetView"].exists
    }

    var inOnDictionary: Bool {
        return app.otherElements["DictionaryView"].exists
    }
}
