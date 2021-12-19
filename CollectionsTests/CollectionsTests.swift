//
//  CollectionsTests.swift
//  CollectionsTests
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import XCTest
@testable import Collections

class CollectionsTests: XCTestCase {

    var sut: Array!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Array()

    }

    override func tearDownWithError() throws {
        sut = Array()

        try super.tearDownWithError()
    }

    func testExample() throws {

        self.measure {
//            sut.array(number: 10_000_000)
        }

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
