//
//  SetUnitTests.swift
//  CollectionsUnitTests
//
//  Created by Иван Тарасенко on 26.02.2022.
//

import XCTest
@testable import Collections

class SetUnitTests: XCTestCase {

        var mut: SetViewModel!

        let firstString = "Abcdefg"
        let secondString = "AbcdY"
        let wrongAnswer = "qwerty"

        override func setUpWithError() throws {
            try super.setUpWithError()
            mut = SetViewModel()

        }

        override func tearDownWithError() throws {
            mut = SetViewModel()
            try super.tearDownWithError()
        }

        func testAllMatchingLetters() throws {
            let answer = "Abcd"
            let result = mut.answerMatchingletter(first: firstString, second: secondString)
            XCTAssertNotNil(result)
            XCTAssertEqual(result, answer)
            XCTAssertNotEqual(result, wrongAnswer)
        }

        func testAllMatchingDoNotCharacter() throws {
            let answer = "Yefg"
            let result = mut.answerDoNotMatchLetter(first: firstString, second: secondString)
            XCTAssertNotNil(result)
            XCTAssertEqual(result, answer)
            XCTAssertNotEqual(result, wrongAnswer)
        }

        func testUniqueCharactersFromFirstField() throws {
            let answer = "efg"
            let result = mut.answerCharacterDifference(first: firstString, second: secondString)
            XCTAssertNotNil(result)
            XCTAssertEqual(result, answer)
            XCTAssertNotEqual(result, wrongAnswer)
        }
    }
