//
//  ArrayUnitTests.swift
//  CollectionsUnitTests
//
//  Created by Иван Тарасенко on 02.05.2022.
//

import XCTest
@testable import Collections

class ArrayUnitTests: XCTestCase {

    var mut: ArrayViewModel!
    var sut: ArrayViewController!

    let titleBigArray = NSLocalizedString("titleBigArray", comment: "")
    let indexPathBigArray = IndexPath(row: 0, section: 0)

    let titleInset = NSLocalizedString("insetOperations", comment: "")
    let indexPathInset = IndexPath(row: 1, section: 0)

    let titleRemove = NSLocalizedString("removeOperations", comment: "")
    let indexPathRemove = IndexPath(item: 6, section: 0)

    override func setUpWithError() throws {
        try super.setUpWithError()
        mut = ArrayViewModel()
        sut = ArrayViewController()
    }

    override func tearDownWithError() throws {
        mut = ArrayViewModel()
        sut = ArrayViewController()
        try super.tearDownWithError()
    }

    func testTaskCompletionTime() {
        let taskTime = mut.taskCompletionTime {
            _ = Array(0...9_999)
        }
        XCTAssertNotNil(taskTime)
    }

    func testupdateResultTitleCell() {
        let resultFirst = mut.updateCell(indexPathCell: indexPathBigArray)
        let resultSecond = mut.updateCell(indexPathCell: indexPathInset)
        let resultThird = mut.updateCell(indexPathCell: indexPathRemove)

        XCTAssertNotNil(resultFirst)
        XCTAssertNotNil(resultSecond)
        XCTAssertNotNil(resultThird)
        XCTAssertEqual(resultFirst, titleBigArray)
        XCTAssertEqual(resultSecond, titleInset)
        XCTAssertEqual(resultThird, titleRemove)
    }

    func testOperationsWithBigArray() throws {
        let createBigArray = mut.createBigArray(indexPath: indexPathBigArray)
        XCTAssertNotNil(createBigArray)
    }
// MARK: - tests added elements.
    func testInsertBeginOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertBeginOnce = mut.insertBeginOnce(indexPath: indexPathInset)
        XCTAssertNotNil(insertBeginOnce)
    }

    func testInsertBeginOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertBeginOneTime = mut.insertBeginOneTime(indexPath: indexPathInset)
        XCTAssertNotNil(insertBeginOneTime)
    }

    func testInsertMiddleOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertMiddleOnce = mut.insertMiddleOnce(indexPath: indexPathInset)
        XCTAssertNotNil(insertMiddleOnce)
    }

    func testInsertMiddleOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertMiddleOneTime = mut.insertMiddleOneTime(indexPath: indexPathInset)
        XCTAssertNotNil(insertMiddleOneTime)
    }

    func testInsertTheEndOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertTheEndOnce = mut.insertTheEndOnce(indexPath: indexPathInset)
        XCTAssertNotNil(insertTheEndOnce)
    }

    func testInsertTheEndOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertTheEndOneTime = mut.insertTheEndOneTime(indexPath: indexPathInset)
        XCTAssertNotNil(insertTheEndOneTime)
    }

// MARK: - tests remove elements.
    func testRemoveBeginOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeBeginOnce = mut.removeBeginOnce(indexPath: indexPathRemove)
        XCTAssertNotNil(removeBeginOnce)
    }

    func testRemoveBeginOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeBeginOneTime = mut.removeBeginOneTime(indexPath: indexPathRemove)
        XCTAssertNotNil(removeBeginOneTime)
    }

    func testRemoveMiddleOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeMiddleOnce = mut.removeMiddleOnce(indexPath: indexPathRemove)
        XCTAssertNotNil(removeMiddleOnce)
    }

    func testRemoveMiddleOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeMiddleOneTime = mut.removeMiddleOneTime(indexPath: indexPathRemove)
        XCTAssertNotNil(removeMiddleOneTime)
    }

    func testRemoveTheEndOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeTheEndOnce = mut.removeTheEndOnce(indexPath: indexPathRemove)
        XCTAssertNotNil(removeTheEndOnce)
    }

    func testRemoveTheEndOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeTheEndOneTime = mut.removeTheEndOneTime(indexPath: indexPathRemove)
        XCTAssertNotNil(removeTheEndOneTime)
    }

    func testOfPerformingOperationsWithArray() throws {
        let indexPath = IndexPath(row: 0, section: 0)
        let expection = self.expectation(description: "completion")

        mut.performOperations(indexPath: indexPath) { [weak self] in
            guard let self = self else { return }
            XCTAssertEqual(self.mut.cellData.count, 13)
            XCTAssertNotNil(self.mut.cellData[0].title)

            XCTAssertEqual(self.mut.cellData[1].title, NSLocalizedString("insertBeginOnce", comment: ""))
            XCTAssertEqual(self.mut.cellData[2].title, NSLocalizedString("insertBeginOneTime", comment: ""))
            XCTAssertEqual(self.mut.cellData[3].title, NSLocalizedString("insertMiddleOnce", comment: ""))
            XCTAssertEqual(self.mut.cellData[4].title, NSLocalizedString("insertMiddleOneTime", comment: ""))
            XCTAssertEqual(self.mut.cellData[5].title, NSLocalizedString("insertTheEndOnce", comment: ""))
            XCTAssertEqual(self.mut.cellData[6].title, NSLocalizedString("insertTheEndOneTime", comment: ""))
            XCTAssertEqual(self.mut.cellData[7].title, NSLocalizedString("removeBeginOnce", comment: ""))
            XCTAssertEqual(self.mut.cellData[8].title, NSLocalizedString("removeBeginOneTime", comment: ""))
            XCTAssertEqual(self.mut.cellData[9].title, NSLocalizedString("removeMiddleOnce", comment: ""))
            XCTAssertEqual(self.mut.cellData[10].title, NSLocalizedString("removeMiddleOneTime", comment: ""))
            XCTAssertEqual(self.mut.cellData[11].title, NSLocalizedString("removeTheEndOnce", comment: ""))
            XCTAssertEqual(self.mut.cellData[12].title, NSLocalizedString("removeTheEndOneTime", comment: ""))
            expection.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
