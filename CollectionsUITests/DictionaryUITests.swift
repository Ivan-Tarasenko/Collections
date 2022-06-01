//
//  DictionaryUITests.swift
//  CollectionsUITests
//
//  Created by Иван Тарасенко on 14.05.2022.
//

import XCTest

class DictionaryUITests: XCTestCase {

    var app: XCUIApplication!
    var dictionaryCell: XCUIElement!
    var headerArray: XCUIElement!
    var headerDictionary: XCUIElement!

    override func setUpWithError() throws {

        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        dictionaryCell = app.cells.element(boundBy: 2)
        headerArray = app.staticTexts["Array"]
        headerDictionary = app.staticTexts["Dictionary"]

    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testPresenceOfTheAllCells() throws {
        dictionaryCell.tap()
        sleep(8)

        let countCell = app.collectionViews.cells.count - 1

        for index in 0...countCell {
            XCTAssert(app.cells.element(boundBy: index).exists)
        }
    }

    func testForThePresenceOfHeaders() {
        dictionaryCell.tap()
        sleep(8)

        XCTAssert(headerArray.exists)
        XCTAssert(headerDictionary.exists)
    }

    func testChangeLabel() {
        dictionaryCell.tap()
        sleep(8)

        let countCell = app.collectionViews.cells.count - 1

        for index in 0...countCell {
            app.cells.element(boundBy: index).tap()
        }

        sleep(15)
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 0).label, NSLocalizedString("findFirstAnswer", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 1).label, NSLocalizedString("findFirstAnswer", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 2).label, NSLocalizedString("findLastAnswer", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 3).label, NSLocalizedString("findLastAnswer", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 4).label, NSLocalizedString("searchForNonExistingAnswer", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 5).label, NSLocalizedString("searchForNonExistingAnswer", comment: ""))
    }
}
