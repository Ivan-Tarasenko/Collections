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
    var data: ArrayDataManager!

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
        data = ArrayDataManager()
    }

    override func tearDownWithError() throws {
        mut = ArrayViewModel()
        sut = ArrayViewController()
        data = ArrayDataManager()
        try super.tearDownWithError()
    }

    func testTaskCompletionTime() {
        let taskTime = mut.taskCompletionTime {
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

        let resultFirst = mut.updateCell(indexPathCell: indexPathFirst)
        let resultSecond = mut.updateCell(indexPathCell: indexPathSecond)
        let resultThird = mut.updateCell(indexPathCell: indexPathThird)

        XCTAssertNotNil(resultFirst)
        XCTAssertNotNil(resultSecond)
        XCTAssertNotNil(resultThird)
        XCTAssertEqual(resultFirst, titleBigArray)
        XCTAssertEqual(resultSecond, insetOperations)
        XCTAssertEqual(resultThird, removeOperations)
    }

    func testOperationsWithBigArray() throws {
        let createBigArray = mut.createBigArray(indexPath: indexPathBigArray)
        let timeCreateBigArray = getOperationTime(string: createBigArray)
        XCTAssertNotNil(createBigArray)
        XCTAssertEqual(createBigArray, "\(titleBigArray) \(timeCreateBigArray) ms.")
    }
// MARK: - tests added elements.
    func testInsertBeginOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertBeginOnce = mut.insertBeginOnce(indexPath: indexPathInset)
        let timeOperation = getOperationTime(string: insertBeginOnce)
        XCTAssertNotNil(insertBeginOnce)
        XCTAssertEqual(insertBeginOnce, "\(titleInset) \(timeOperation) ms.")
    }

    func testInsertBeginOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertBeginOneTime = mut.insertBeginOneTime(indexPath: indexPathInset)
        let timeOperation = getOperationTime(string: insertBeginOneTime)
        XCTAssertNotNil(insertBeginOneTime)
        XCTAssertEqual(insertBeginOneTime, "\(titleInset) \(timeOperation) ms.")
    }

    func testInsertMiddleOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertMiddleOnce = mut.insertMiddleOnce(indexPath: indexPathInset)
        let timeOperation = getOperationTime(string: insertMiddleOnce)
        XCTAssertNotNil(insertMiddleOnce)
        XCTAssertEqual(insertMiddleOnce, "\(titleInset) \(timeOperation) ms.")
    }

    func testInsertMiddleOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertMiddleOneTime = mut.insertMiddleOneTime(indexPath: indexPathInset)
        let timeOperation = getOperationTime(string: insertMiddleOneTime)
        XCTAssertNotNil(insertMiddleOneTime)
        XCTAssertEqual(insertMiddleOneTime, "\(titleInset) \(timeOperation) ms.")
    }

    func testInsertTheEndOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertTheEndOnce = mut.insertTheEndOnce(indexPath: indexPathInset)
        let timeOperation = getOperationTime(string: insertTheEndOnce)
        XCTAssertNotNil(insertTheEndOnce)
        XCTAssertEqual(insertTheEndOnce, "\(titleInset) \(timeOperation) ms.")
    }

    func testInsertTheEndOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let insertTheEndOneTime = mut.insertTheEndOneTime(indexPath: indexPathInset)
        let timeOperation = getOperationTime(string: insertTheEndOneTime)
        XCTAssertNotNil(insertTheEndOneTime)
        XCTAssertEqual(insertTheEndOneTime, "\(titleInset) \(timeOperation) ms.")
    }

// MARK: - tests remove elements.
    func testRemoveBeginOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeBeginOnce = mut.removeBeginOnce(indexPath: indexPathRemove)
        let timeOperation = getOperationTime(string: removeBeginOnce)
        XCTAssertNotNil(removeBeginOnce)
        XCTAssertEqual(removeBeginOnce, "\(titleRemove) \(timeOperation) ms.")
    }

    func testRemoveBeginOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeBeginOneTime = mut.removeBeginOneTime(indexPath: indexPathRemove)
        let timeOperation = getOperationTime(string: removeBeginOneTime)
        XCTAssertNotNil(removeBeginOneTime)
        XCTAssertEqual(removeBeginOneTime, "\(titleRemove) \(timeOperation) ms.")
    }

    func testRemoveMiddleOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeMiddleOnce = mut.removeMiddleOnce(indexPath: indexPathRemove)
        let timeOperation = getOperationTime(string: removeMiddleOnce)
        XCTAssertNotNil(removeMiddleOnce)
        XCTAssertEqual(removeMiddleOnce, "\(titleRemove) \(timeOperation) ms.")
    }

    func testRemoveMiddleOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeMiddleOneTime = mut.removeMiddleOneTime(indexPath: indexPathRemove)
        let timeOperation = getOperationTime(string: removeMiddleOneTime)
        XCTAssertNotNil(removeMiddleOneTime)
        XCTAssertEqual(removeMiddleOneTime, "\(titleRemove) \(timeOperation) ms.")
    }

    func testRemoveTheEndOnce() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeTheEndOnce = mut.removeTheEndOnce(indexPath: indexPathRemove)
        let timeOperation = getOperationTime(string: removeTheEndOnce)
        XCTAssertNotNil(removeTheEndOnce)
        XCTAssertEqual(removeTheEndOnce, "\(titleRemove) \(timeOperation) ms.")
    }

    func testRemoveTheEndOneTime() throws {
        _ = mut.createBigArray(indexPath: indexPathBigArray)
        let removeTheEndOneTime = mut.removeTheEndOneTime(indexPath: indexPathRemove)
        let timeOperation = getOperationTime(string: removeTheEndOneTime)
        XCTAssertNotNil(removeTheEndOneTime)
        XCTAssertEqual(removeTheEndOneTime, "\(titleRemove) \(timeOperation) ms.")
    }

//    func testOfPerformingOperationsWithArray() throws {
//        let indexPath = IndexPath(row: 0, section: 0)
//        let items = sut.collectionView
//
//        mut.performOperations(indexPath: indexPath) {
//            XCTAssertEqual("foo", "Bar")
//        }
//    }

    func testDataManagerNotNil() throws {
       let test = data.fetchArrayData()
        XCTAssertNotNil(test)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func getOperationTime(string: String) -> Double {
        let str = string.components(separatedBy: CharacterSet.init(charactersIn: "0123456789.").inverted).joined(separator: "")
        let result = NSString(string: str).doubleValue
        return result
    }

}
