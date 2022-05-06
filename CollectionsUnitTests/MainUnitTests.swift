//
//  MainUnitTests.swift
//  CollectionsUnitTests
//
//  Created by Иван Тарасенко on 02.05.2022.
//

import XCTest
@testable import Collections

class MainUnitTests: XCTestCase {

    var sut: MainViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MainViewModel()

    }

    override func tearDownWithError() throws {
      sut = MainViewModel()
        try super.tearDownWithError()
    }

    func testGetRandomValue() throws {
        let result = sut.getRandomValue()
        XCTAssertNotNil(result)
    }

}
