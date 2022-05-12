//
//  ArrayUITest.swift
//  CollectionsUITests
//
//  Created by Иван Тарасенко on 11.05.2022.
//
import XCTest

class ArrayUITest: XCTestCase {

    var app: XCUIApplication!
    var arrayCell: XCUIElement!
    var firstCell: XCUIElement!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        arrayCell = app.cells.element(boundBy: 0)
        firstCell = app.cells.staticTexts.element(boundBy: 0)
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testPresenceOfTheAllCells() throws {
        arrayCell.tap()
        firstCell.tap()
        sleep(2)

        let countCell = app.collectionViews.cells.count - 1

        for index in 1...countCell {
            XCTAssert(app.cells.element(boundBy: index).exists)
        }
    }

    func testChangeLabel() {
        arrayCell.tap()
        firstCell.tap()
        sleep(2)

        let countCell = app.collectionViews.cells.count - 1

        for index in 1...countCell {
            app.cells.element(boundBy: index).tap()
        }

        XCTAssertNotEqual(firstCell.label, NSLocalizedString("titleBigArray", comment: ""))

        sleep(3)

        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 1).label, NSLocalizedString("insertBeginOnce", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 2).label, NSLocalizedString("insertBeginOneTime", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 3).label, NSLocalizedString("insertMiddleOnce", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 4).label, NSLocalizedString("insertMiddleOneTime", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 5).label, NSLocalizedString("insertTheEndOnce", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 6).label, NSLocalizedString("insertTheEndOneTime", comment: ""))
        
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 7).label, NSLocalizedString("removeBeginOnce", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 8).label, NSLocalizedString("removeBeginOneTime", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 9).label, NSLocalizedString("removeMiddleOnce", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 10).label, NSLocalizedString("removeMiddleOneTime", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 11).label, NSLocalizedString("removeTheEndOnce", comment: ""))
        XCTAssertNotEqual(app.cells.staticTexts.element(boundBy: 12).label, NSLocalizedString("removeTheEndOneTime", comment: ""))

    }
}
