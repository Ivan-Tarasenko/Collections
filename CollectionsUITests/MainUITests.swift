//
//  MainUITests.swift
//  CollectionsUITests
//
//  Created by Иван Тарасенко on 02.05.2022.
//

import XCTest

class MainUITests: XCTestCase {

    let identifier = MainVCIdentifier()

    var app: XCUIApplication!
    var array: XCUIElement!
    var set: XCUIElement!
    var dictionary: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        array = app.staticTexts[identifier.arrayCell]
        set = app.staticTexts[identifier.setCell]
        dictionary = app.staticTexts[identifier.dictionaryCell]

    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        XCTAssertTrue(array.exists)
        XCTAssertTrue(set.exists)
        XCTAssertTrue(dictionary.exists)
    }

    func testCellArray() throws {
        array.tap()
    }

    func testCellSet() throws {
        set.tap()
    }

    func testCellDictionary() throws {
        dictionary.tap()
    }
}
