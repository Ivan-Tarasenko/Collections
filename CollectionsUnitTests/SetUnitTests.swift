//
//  SetUnitTests.swift
//  CollectionsUnitTests
//
//  Created by Иван Тарасенко on 26.02.2022.
//

import XCTest
@testable import Collections

class SetUnitTests: XCTestCase {

        var sut: SetViewModel!

        let firstString = "Abcdefg"
        let secondString = "AbcdY"
        let wrongAnswer = "qwerty"

        override func setUpWithError() throws {
            try super.setUpWithError()
            sut = SetViewModel()

        }

        override func tearDownWithError() throws {
            sut = SetViewModel()
            try super.tearDownWithError()
        }

        func testAllMatchingLetters() throws {
            let answer = "Abcd"
            let result = sut.answerMatchingletter(first: firstString, second: secondString)
            XCTAssertNotNil(result)
            XCTAssertEqual(result, answer)
            XCTAssertNotEqual(result, wrongAnswer)
        }

        func testAllMatchingDoNotCharacter() throws {
            let answer = "Yefg"
            let result = sut.answerDoNotMatchLetter(first: firstString, second: secondString)
            XCTAssertNotNil(result)
            XCTAssertEqual(result, answer)
            XCTAssertNotEqual(result, wrongAnswer)
        }

        func testUniqueCharactersFromFirstField() throws {
            let answer = "efg"
            let result = sut.answerCharacterDifference(first: firstString, second: secondString)
            XCTAssertNotNil(result)
            XCTAssertEqual(result, answer)
            XCTAssertNotEqual(result, wrongAnswer)
        }
    }
