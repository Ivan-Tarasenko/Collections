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
    
    private(set) var cellData: [ArrayCollectionModel] = []
    private var dataManager = ArrayDataManager.shared

    let queueMain = DispatchQueue.main
    let concurrentQueue = DispatchQueue(label: "CreateBigArrayQueue", attributes: .concurrent)

    private let insetOperations = NSLocalizedString("insetOperations", comment: "")
    private let removeOpreations = NSLocalizedString("removeOpreations", comment: "")

    private let littleArray = Array(0...999)
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
    bigArray = Array(0...9_999_999)
}
    }
    
// MARK: - Funcsions adding and removing elements in big array
    
    // Inserting 1000 elements at the beginning of the array at once
    func insertBeginOnce() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            bigArray.insert(contentsOf: littleArray, at: 0)
        })
    }

    // Inserting 1000 elements at the beginning of the array one at a time
    func insertBeginOneTime() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            littleArray.forEach({bigArray.insert(
                $0, at: bigArray.startIndex)}
            )
        })
    }

    // Inserting 1000 elements into the middle of the array at once
    func insertMiddleOnce() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            bigArray.insert(contentsOf: littleArray, at: middleBigArray)
        })
    }

    // Inserting 1000 elements into the middle of the array one at a time
    func insertMiddleOneTime() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            littleArray.forEach({bigArray.insert($0, at: middleBigArray)})
        })
    }

    // Inserting 1000 elements at the end of the array at once
    func insertTheEndOnce() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            bigArray += littleArray
        })
    }

    // Inserting 1000 elements at the end of the array one at a time
    func insertTheEndOneTime() -> String {
        return taskCompletionTime(string: insetOperations, execute: {
            littleArray.forEach({bigArray.insert(
                $0, at: bigArray.endIndex)}
            )
        })
    }

    // Removing 1000 elements from the beginning of the array at once
    func removeBeginOnce() -> String {
        return taskCompletionTime(string: removeOpreations, execute: {
            bigArray.removeFirst(littleArray.count)
        })
    }

    // Removing 1000 elements from the beginning of the array one at a time
    func removeBeginOneTime() -> String {
        return taskCompletionTime(string: removeOpreations, execute: {
            for element in littleArray {
                bigArray.remove(at: element)
            }
        })
    }

    // Removing 1000 elements from the middle of the array at once
    func removeMiddleOnce() -> String {

        let range = middleBigArray...(middleBigArray + (littleArray.count - 1))

        return taskCompletionTime(string: removeOpreations, execute: {
            bigArray.removeSubrange(range)
        })
    }
    
// Removing 1000 elements from the middle of the array one at a time
    func removeMiddleOneTime() -> String {
        return taskCompletionTime(string: removeOpreations, execute: {
            for element in littleArray {
                bigArray.remove(at: middleBigArray + element)
            }
        })
    }
    
// Removing 1000 elements from the end of the array at once"
    func removeTheEndOnce() -> String {
        return taskCompletionTime(string: removeOpreations, execute: {
            bigArray.removeLast(littleArray.count)
        })
    }
    
// Removing 1000 elements from the end of the array one at a time
    func removeTheEndOneTime() -> String { 
        return taskCompletionTime(string: removeOpreations, execute: {
            guard let lastElement = bigArray.last else { return }

            for _ in littleArray {
                bigArray.remove(at: lastElement)
            }
        })
    }
}
