//
//  ArrayViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 13.03.2022.
//

import Foundation
import UIKit

class ArrayViewModel {

    var bigArray = [Int]()
    
    let queueMain = DispatchQueue.main
    let concurrentQueue = DispatchQueue(label: "CreateBigArrayQueue", attributes: .concurrent)

    private(set) var cellData: [ArrayCollectionModel] = []
    private var dataManager = ArrayDataManager.shared

    private let insetOperations = NSLocalizedString("insetOperations", comment: "")
    private let removeOpreations = NSLocalizedString("removeOpreations", comment: "")

    private let addArray = Array(0...9999)
    private var middleBigArray = Int()

    init() {
        cellData = dataManager.fetchArrayData()
        middleBigArray = bigArray.count / 2
    }

    // Method for determining the algorithm execution speed.
    func taskCompletionTime (string: String, execute: () -> Void ) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        execute()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        let timeElapsedDouble = Double(timeElapsed)
        let answer = (round(1000 * timeElapsedDouble) / 1000)
        return "\(string): \(answer) ms."
    }

    // MARK: - Craate big array
    func createBigArray() -> String {
return taskCompletionTime(string: "Time create Big Array") {
    bigArray = Array(0...9_999_99)
}
    }
    
// MARK: - Funcsions adding and removing elements in big array
    
    // Inserting 1000 elements at the beginning of the array at once
    func insertBeginOnce() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            bigArray.insert(contentsOf: addArray, at: 0)
            print(bigArray.count)
        })
    }

    // Inserting 1000 elements at the beginning of the array one at a time
    func insertBeginOneTime() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            addArray.forEach({bigArray.insert(
                $0, at: bigArray.startIndex)}
            )
            print(bigArray.count)
        })
    }

    // Inserting 1000 elements into the middle of the array at once
    func insertMiddleOnce() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            bigArray.insert(contentsOf: addArray, at: middleBigArray)
            print(bigArray.count)
        })
    }

    // Inserting 1000 elements into the middle of the array one at a time
    func insertMiddleOneTime() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            addArray.forEach({bigArray.insert($0, at: middleBigArray)})
            print(bigArray.count)
        })
    }

    // Inserting 1000 elements at the end of the array at once
    func insertTheEndOnce() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            bigArray += addArray
            print(bigArray.count)
        })
    }

    // Inserting 1000 elements at the end of the array one at a time
    func insertTheEndOneTime() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            addArray.forEach({bigArray.insert(
                $0, at: bigArray.endIndex)}
            )
            print(bigArray.count)
        })
    }

    // Removing 1000 elements from the beginning of the array at once
    func removeBeginOnce() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            bigArray.removeFirst(10)
            print(bigArray.count)
        })
    }

    // Removing 1000 elements from the beginning of the array one at a time
    func removeBeginOneTime() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
//            for element in addArray {
//                bigArrayModel.bigArray.removeFirst(element)
//            }
        })
    }

    // Removing 1000 elements from the middle of the array at once
    func removeMiddleOnce() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            bigArray.removeSubrange(middleBigArray...(middleBigArray + 9))
            print(bigArray.count)
        })
    }
    
// Removing 1000 elements from the middle of the array one at a time
    func removeMiddleOneTime() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            for element in addArray {
                bigArray.remove(at: middleBigArray + element) // race conditon
            }
            print(bigArray.count)
        })
    }
    
// Removing 1000 elements from the end of the array at once"
    func removeTheEndOnce() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            bigArray.removeLast(10)
            print(bigArray.count)
        })
    }
    
// Removing 1000 elements from the end of the array one at a time
    func removeTheEndOneTime() -> String { 
        return taskCompletionTime(string: insetOperations, execute: {
//            for element in addArray {
//                bigArrayModel.bigArray.removeLast(element)
//            }
            print(bigArray.count)
        })
    }
}
