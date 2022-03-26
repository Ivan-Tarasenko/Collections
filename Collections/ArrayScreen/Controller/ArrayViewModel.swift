//
//  ArrayViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 13.03.2022.
//

import Foundation
import UIKit

class ArrayViewModel {

    var bigArrayData = [Int]()
    
    private(set) var cellData: [ArrayCollectionModel] = []
    private var dataManager = ArrayDataManager.shared

    init() {
        cellData = dataManager.fetchArrayData()
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

    // MARK: - Create big array
    func createBigArray() -> String {
        var array = [Int]()
        let crateArray = taskCompletionTime(string: "Time create Big Array") {
            for int in 0...9_999_999 {
                array.append(int)
            }
        }
        bigArrayData = array
        return crateArray
    }
    
    // MARK: - Functions adding and removing elements in big array
    
    // Inserting 1000 elements at the beginning of the array at once
    func insertBeginOnce() -> String {
        var array = bigArrayData
        let addElements = Array(0...999)
        let insetOperations = NSLocalizedString("insetOperations", comment: "")
        let insetTitle = taskCompletionTime(string: insetOperations, execute: {
            array.insert(contentsOf: addElements, at: 0)
        })
        bigArrayData = array
        return insetTitle
    }

    // Inserting 1000 elements at the beginning of the array one at a time
    func insertBeginOneTime() -> String {
        var array = bigArrayData
        let addElements = Array(0...999)
        let insetOperations = NSLocalizedString("insetOperations", comment: "")
        let insetTitle = taskCompletionTime(string: insetOperations, execute: {
            for int in addElements {
                array.insert(int, at: array.startIndex)
            }
        })
        bigArrayData = array
        return insetTitle
    }

    // Inserting 1000 elements into the middle of the array at once
    func insertMiddleOnce() -> String {
        var array = bigArrayData
        let addElements = Array(0...999)
        let insetOperations = NSLocalizedString("insetOperations", comment: "")
        let insetTitle = taskCompletionTime(string: insetOperations, execute: {
            array.insert(contentsOf: addElements, at: array.count / 2)
        })
        bigArrayData = array
        return insetTitle
    }

    // Inserting 1000 elements into the middle of the array one at a time
    func insertMiddleOneTime() -> String {
        var array = bigArrayData
        let addElements = Array(0...999)
        let insetOperations = NSLocalizedString("insetOperations", comment: "")
        let insetTitle = taskCompletionTime(string: insetOperations, execute: {
            for element in addElements {
                array.insert(element, at: array.count / 2 )
            }
        })
        bigArrayData = array
        return insetTitle
    }

    // Inserting 1000 elements at the end of the array at once
    func insertTheEndOnce() -> String {
        var array = bigArrayData
        let addElements = Array(0...999)
        let insetOperations = NSLocalizedString("insetOperations", comment: "")
        let insetTitle = taskCompletionTime(string: insetOperations, execute: {
            array += addElements
        })
        bigArrayData = array
        return insetTitle
    }

    // Inserting 1000 elements at the end of the array one at a time
    func insertTheEndOneTime() -> String {
        var array = bigArrayData
        let addElements = Array(0...999)
        let insetOperations = NSLocalizedString("insetOperations", comment: "")
        let insetTitle = taskCompletionTime(string: insetOperations, execute: {
            for element in addElements {
                array.insert(element, at: array.endIndex)
            }
        })
        bigArrayData = array
        return insetTitle
    }

    // Removing 1000 elements from the beginning of the array at once
    func removeBeginOnce() -> String {
        var array = bigArrayData
        let removeElements = Array(0...999)
        let removeOperations = NSLocalizedString("removeOperations", comment: "")
        let removeTitle = taskCompletionTime(string: removeOperations, execute: {
            array.removeFirst(removeElements.count)
        })
        bigArrayData = array
        return removeTitle
    }

    // Removing 1000 elements from the beginning of the array one at a time
    func removeBeginOneTime() -> String {
        var array = bigArrayData
        let removeElements = Array(0...999)
        let removeOperations = NSLocalizedString("removeOperations", comment: "")
        let removeTitle = taskCompletionTime(string: removeOperations, execute: {
            for element in removeElements {
                array.remove(at: element)
            }
        })
        bigArrayData = array
        return removeTitle
    }

    // Removing 1000 elements from the middle of the array at once
    func removeMiddleOnce() -> String {
        var array = bigArrayData
        let removeElements = Array(0...999)
        let removeOperations = NSLocalizedString("removeOperations", comment: "")
        let range = (array.count / 2)...((array.count / 2) + (removeElements.count - 1))

        let removeTitle = taskCompletionTime(string: removeOperations, execute: {
            array.removeSubrange(range)
        })
        bigArrayData = array
        return removeTitle
    }
    
    // Removing 1000 elements from the middle of the array one at a time
    func removeMiddleOneTime() -> String {
        var array = bigArrayData
        let removeElements = Array(0...999)
        let removeOperations = NSLocalizedString("removeOperations", comment: "")
        let removeTitle = taskCompletionTime(string: removeOperations, execute: {
            for element in removeElements {
                array.remove(at: (array.count / 2) + element)
            }
        })
        bigArrayData = array
        return removeTitle
    }
    
    // Removing 1000 elements from the end of the array at once"
    func removeTheEndOnce() -> String {
        var array = bigArrayData
        let removeElements = Array(0...999)
        let removeOperations = NSLocalizedString("removeOperations", comment: "")
        let removeTitle = taskCompletionTime(string: removeOperations, execute: {
            array.removeLast(removeElements.count)
        })
        bigArrayData = array
        return removeTitle
    }
    
    // Removing 1000 elements from the end of the array one at a time
    func removeTheEndOneTime() -> String {
        var array = bigArrayData
        let removeElements = Array(0...999)
        let removeOperations = NSLocalizedString("removeOperations", comment: "")
        let removeTitle = taskCompletionTime(string: removeOperations, execute: {
            for _ in removeElements {
                array.removeLast()
            }
        })
        bigArrayData = array
        return removeTitle
    }

    // MARK: - Working with threads
    func setQueueForStartCell(cell: ArrayCollectionViewCell) {
        let concurrentQueue = DispatchQueue(label: "QueueForStartCell", attributes: .concurrent)
        concurrentQueue.sync {
            cell.workStart()
        }
    }

    func setQueueFinishCell(cell: ArrayCollectionViewCell, titleCell: String) {
        let queueMain = DispatchQueue.main
        queueMain.sync {
            cell.workFinish(title: titleCell)
        }
    }

    func setQueuesForCreateBigArrayData(
        collection: UICollectionView,
        indexPath: IndexPath,
        cell: ArrayCollectionViewCell
    ) {
        let queueMain = DispatchQueue.main
        let concurrentQueue = DispatchQueue(label: "CreateBigArrayQueue", attributes: .concurrent)

        setQueueForStartCell(cell: cell)

        concurrentQueue.async { [self] in
            let timeOperation = createBigArray()
            queueMain.sync {
                if indexPath.section == 0 {
                    collection.reloadData()
                }
            }
            setQueueFinishCell(cell: cell, titleCell: timeOperation)
        }
    }

    func setQueuesForOperationsWithBigArrayData(
        indexPath: IndexPath,
        cell: ArrayCollectionViewCell
    ) {
        var timeOperation = String()
        let concurrentQueue = DispatchQueue(label: "QueueOperationsWithBigArrayData", attributes: .concurrent)
        if !bigArrayData.isEmpty && indexPath.section != 0 {
            setQueueForStartCell(cell: cell)

            concurrentQueue.async { [self] in
                if indexPath.section == 1 {
                    switch indexPath.row {
                    case 0:
                        timeOperation = insertBeginOnce()
                    case 1:
                        timeOperation = insertBeginOneTime()
                    case 2:
                        timeOperation = insertMiddleOnce()
                    case 3:
                        timeOperation = insertMiddleOneTime()
                    case 4:
                        timeOperation = insertTheEndOnce()
                    case 5:
                        timeOperation = insertTheEndOneTime()
                    case 6:
                        timeOperation = removeBeginOnce()
                    case 7:
                        timeOperation = removeBeginOneTime()
                    case 8:
                        timeOperation = removeMiddleOnce()
                    case 9:
                        timeOperation = removeMiddleOneTime()
                    case 10:
                        timeOperation = removeTheEndOnce()
                    case 11:
                        timeOperation = removeTheEndOneTime()
                    default:
                        break
                    }
                }
                setQueueFinishCell(cell: cell, titleCell: timeOperation)
            }

        } else {
            setQueueForStartCell(cell: cell)

            concurrentQueue.async { [self] in
                timeOperation = createBigArray()
                setQueueFinishCell(cell: cell, titleCell: timeOperation)
            }
        }
    }
}
