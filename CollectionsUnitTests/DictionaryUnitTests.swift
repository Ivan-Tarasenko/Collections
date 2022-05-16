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

        mut.createCollections { [weak self] in
            guard let self = self else { return }
            XCTAssertNotNil(self.mut.contactArray)
            XCTAssertNotNil(self.mut.contactDictionary)
            XCTAssertEqual(self.mut.contactArray.count, 10_000_000)
            XCTAssertEqual(self.mut.contactDictionary.count, 10_000_000)
            expection.fulfill()
        }
        waitForExpectations(timeout: 60, handler: nil)

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

        mut.fetchData()

        mut.perfomingOperations(indexPath: indexPath) { [weak self] in
            guard let self = self else { return }
            XCTAssertEqual(self.mut.cellData[0].title, NSLocalizedString("findLastAnswer", comment: ""))

            expectionPerfomingOperation.fulfill()
        }

        wait(for: [expectionPerfomingOperation], timeout: 1000)
    }
}
