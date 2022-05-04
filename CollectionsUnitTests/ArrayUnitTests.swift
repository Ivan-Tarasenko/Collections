//
//  ArrayUnitTests.swift
//  CollectionsUnitTests
//
//  Created by Иван Тарасенко on 02.05.2022.
//

import XCTest
@testable import Collections

class ArrayUnitTests: XCTestCase {

    var sut: ArrayViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ArrayViewModel()
    }

    override func tearDownWithError() throws {
        sut = ArrayViewModel()
        try super.tearDownWithError()
    }

    func testRemoveFirstIndex() {
        var testArray: [Any] = ["a", "b", "c", "d"]
        sut.removeFirstIndex(sequence: &testArray)
        XCTAssertNotNil(testArray)
        XCTAssertEqual(testArray.count, 3)
    }

    func testTaskCompletionTime() {
        let taskTime = sut.taskCompletionTime {
            _ = Array(0...9_999)
        }
        XCTAssertNotNil(taskTime)
    }

    func testupdateResultTitleCell() {
        let titleBigArray = NSLocalizedString("titleBigArray", comment: "")
        let insetOperations = NSLocalizedString("insetOperations", comment: "")
        let removeOperations = NSLocalizedString("removeOperations", comment: "")

        let indexPathFirst = IndexPath(row: 0, section: 0)
        let indexPathSecond = IndexPath(row: 0, section: 1)
        let indexPathThird = IndexPath(row: 7, section: 1)

        let resultFirst = sut.updateCell(indexPathCell: indexPathFirst)
        let resultSecond = sut.updateCell(indexPathCell: indexPathSecond)
        let resultThird = sut.updateCell(indexPathCell: indexPathThird)

        XCTAssertNotNil(resultFirst)
        XCTAssertNotNil(resultSecond)
        XCTAssertNotNil(resultThird)
        XCTAssertEqual(resultFirst, titleBigArray)
        XCTAssertEqual(resultSecond, insetOperations)
        XCTAssertEqual(resultThird, removeOperations)
    }

    func testInputStringCreateBigArray() {
        let indexPath = IndexPath(row: 0, section: 0)
        let result = sut.createBigArray(indexPath: indexPath)
        XCTAssertNotNil(result)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
