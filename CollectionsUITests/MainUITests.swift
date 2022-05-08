//
//  MainUITests.swift
//  CollectionsUITests
//
//  Created by Иван Тарасенко on 02.05.2022.
//

import XCTest

class MainUITests: XCTestCase {

    var app: XCUIApplication!
    var arrayView: XCUIElement!
    var setView: XCUIElement!
    var dictionaryView: XCUIElement!
    var backButtomNavBar: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        arrayView = app.cells.element(boundBy: 0)
        setView = app.cells.element(boundBy: 1)
        dictionaryView = app.cells.element(boundBy: 2)
        backButtomNavBar = app.navigationBars.buttons.element(boundBy: 0)
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        XCTAssertTrue(arrayView.exists)
        XCTAssertTrue(setView.exists)
        XCTAssertTrue(dictionaryView.exists)
    }

    func testOfSwitchingToOtherScreensAndAbout() throws {
        arrayView.tap()
        backButtomNavBar.tap()
        setView.tap()
        backButtomNavBar.tap()
        dictionaryView.tap()
        backButtomNavBar.tap()

    }
}
