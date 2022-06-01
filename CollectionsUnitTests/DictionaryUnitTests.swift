//
//  DictionaryUnitTests.swift
//  CollectionsUnitTests
//
//  Created by Иван Тарасенко on 12.05.2022.
//

import XCTest
@testable import Collections

class DictionaryUnitTests: XCTestCase {

    var mut: DictionaryViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mut = DictionaryViewModel()

    }

    override func tearDownWithError() throws {
        mut = DictionaryViewModel()
        try super.tearDownWithError()
    }

    func testTaskCompletionTime() {
        let string = mut.taskCompletionTime(string: "Test string") {
            _ = Array(0...9_999_99)
        }
        XCTAssertNotNil(string)
    }

    func testCreateCollections() {
        let expection = expectation(description: "completion")

        mut.createCollections {
            expection.fulfill()
        }
        waitForExpectations(timeout: 60, handler: nil)

        XCTAssertEqual(mut.contactArray.count, 10_000_000)
        XCTAssertEqual(mut.contactDictionary.count, 10_000_000)

    }

    func testFfindFirstValueArray() {
        let string = mut.findFirstValueArray()
        XCTAssertNotNil(string)
    }

    func testFindLastValueArray() {
        let string = mut.findLastValueArray()
        XCTAssertNotNil(string)
    }

    func testArraySearchNonExistentValue() {
        let string = mut.arraySearchNonExistentValue()
        XCTAssertNotNil(string)
    }

    func testFindFirstDictionaryValue() {
        let string = mut.findFirstDictionaryValue()
        XCTAssertNotNil(string)
    }

    func testfindLastDictionaryValue() {
        let string = mut.findLastDictionaryValue()
        XCTAssertNotNil(string)
    }

    func testdictionarysSearcNonExistentValue() {
        let string = mut.dictionarysSearcNonExistentValue()
        XCTAssertNotNil(string)
    }

    func testperfomingOperations() {
        let indexPath = IndexPath(row: 0, section: 0)
        let expectionPerfomingOperation = XCTestExpectation(description: "completionPerfomingOperation")
        let expectioncreateCollections = expectation(description: "completionCreateCollections")

        mut.createCollections {
            expectioncreateCollections.fulfill()
        }
        waitForExpectations(timeout: 60, handler: nil)   // Filling collections

        mut.fetchData()                                  // Init cellData
        mut.perfomingOperations(indexPath: indexPath) {
            expectionPerfomingOperation.fulfill()
        }
        wait(for: [expectionPerfomingOperation], timeout: 60) // Performing operation on collections

        // Checking the title change
        XCTAssertNotEqual(mut.cellData[0].title, NSLocalizedString("findFirstAnswer", comment: ""))
    }
}
