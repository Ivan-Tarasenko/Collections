//
//  CollectionsTests.swift
//  CollectionsTests
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import XCTest
@testable import Collections

class CollectionsTests: XCTestCase {

    var sut: Model!

    let stringOne = "Abcdefg"
    let stringTwo = "AbcdY"
    let wrongAnswer = "qwerty"

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Model()

    }

    override func tearDownWithError() throws {
        sut = Model()
        try super.tearDownWithError()
    }

    func testAllMatchingLetters() throws {
        let answer = "Abcd"
        let result = sut.answerMatchingletter(stringOne: stringOne, stringTwo: stringTwo)
        XCTAssertNotNil(result)
        XCTAssertEqual(result, answer)
        XCTAssertNotEqual(result, wrongAnswer)
    }

    func testAllMatchingDoNotCharacter() throws {
        let answer = "Yefg"
        let result = sut.answerDoNotMatchLetter(stringOne: stringOne, stringTwo: stringTwo)
        XCTAssertNotNil(result)
        XCTAssertEqual(result, answer)
        XCTAssertNotEqual(result, wrongAnswer)
    }

    func testUniqueCharactersFromFirstField() throws {
        let answer = "efg"
        let result = sut.answerCharacterDifference(stringOne: stringOne, stringTwo: stringTwo)
        XCTAssertNotNil(result)
        XCTAssertEqual(result, answer)
        XCTAssertNotEqual(result, wrongAnswer)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            sut.answerMatchingletter(stringOne: stringOne, stringTwo: stringTwo)
            // Put the code you want to measure the time of here.
        }
    }

}
