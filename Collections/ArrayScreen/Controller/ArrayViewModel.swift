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
    let arrayOfThousandInt = Array(0...999)

    let queueMain = DispatchQueue.main
    let concurrentQueue = DispatchQueue(label: "CreateBigArrayQueue", attributes: .concurrent)
    
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

    func updateCell(indexPathCell: IndexPath) -> String {
        var title = String()
        switch indexPathCell.row {
        case 0...5:
            title = NSLocalizedString("insetOperations", comment: "")
        case 6...11:
            title = NSLocalizedString("removeOperations", comment: "")
        default:
            break
        }

        if indexPathCell.section == 0 && indexPathCell.row == 0 {
            title = NSLocalizedString("titleBigArray", comment: "")
        }
        return title
    }

    // MARK: - Create big array
    func createBigArray(indexPath: IndexPath) -> String {
        var array = [Int]()
        let crateArray = taskCompletionTime(string: updateCell(indexPathCell: indexPath)) {
            for int in 0...9_999_999 {
                array.append(int)
            }
        }
        bigArrayData = array
        return crateArray
    }
    
    // MARK: - Functions adding and removing elements in big array
    
    // Inserting 1000 elements at the beginning of the array at once
    func insertBeginOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime(string: title, execute: {
            array.insert(contentsOf: arrayOfThousandInt, at: 0)
        })
        bigArrayData = array
        return insetTitle
    }

    // Inserting 1000 elements at the beginning of the array one at a time
    func insertBeginOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime(string: title, execute: {
            for int in arrayOfThousandInt {
                array.insert(int, at: array.startIndex)
            }
        })
        bigArrayData = array
        return insetTitle
    }

    // Inserting 1000 elements into the middle of the array at once
    func insertMiddleOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime(string: title, execute: {
            array.insert(contentsOf: arrayOfThousandInt, at: array.count / 2)
        })
        bigArrayData = array
        return insetTitle
    }

    // Inserting 1000 elements into the middle of the array one at a time
    func insertMiddleOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime(string: title, execute: {
            for element in arrayOfThousandInt {
                array.insert(element, at: array.count / 2 )
            }
        })
        bigArrayData = array
        return insetTitle
    }

    // Inserting 1000 elements at the end of the array at once
    func insertTheEndOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime(string: title, execute: {
            array += arrayOfThousandInt
        })
        bigArrayData = array
        return insetTitle
    }

    // Inserting 1000 elements at the end of the array one at a time
    func insertTheEndOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime(string: title, execute: {
            for element in arrayOfThousandInt {
                array.insert(element, at: array.endIndex)
            }
        })
        bigArrayData = array
        return insetTitle
    }

    // Removing 1000 elements from the beginning of the array at once
    func removeBeginOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let removeTitle = taskCompletionTime(string: title, execute: {
            array.removeFirst(arrayOfThousandInt.count)
        })
        bigArrayData = array
        return removeTitle
    }

    // Removing 1000 elements from the beginning of the array one at a time
    func removeBeginOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let removeTitle = taskCompletionTime(string: title, execute: {
            for element in arrayOfThousandInt {
                array.remove(at: element)
            }
        })
        bigArrayData = array
        return removeTitle
    }

    // Removing 1000 elements from the middle of the array at once
    func removeMiddleOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let range = (array.count / 2)...((array.count / 2) + (arrayOfThousandInt.count - 1))
        let removeTitle = taskCompletionTime(string: title, execute: {
            array.removeSubrange(range)
        })
        bigArrayData = array
        return removeTitle
    }
    
    // Removing 1000 elements from the middle of the array one at a time
    func removeMiddleOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let removeTitle = taskCompletionTime(string: title, execute: {
            for element in arrayOfThousandInt {
                array.remove(at: (array.count / 2) + element)
            }
        })
        bigArrayData = array
        return removeTitle
    }
    
    // Removing 1000 elements from the end of the array at once"
    func removeTheEndOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let removeTitle = taskCompletionTime(string: title, execute: {
            array.removeLast(arrayOfThousandInt.count)
        })
        bigArrayData = array
        return removeTitle
    }
    
    // Removing 1000 elements from the end of the array one at a time
    func removeTheEndOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let removeTitle = taskCompletionTime(string: title, execute: {
            for _ in arrayOfThousandInt {
                array.removeLast()
            }
        })
        bigArrayData = array
        return removeTitle
    }

    // MARK: - Working with threads
    func setQueueForStartCell(cell: ArrayCollectionViewCell) {
        concurrentQueue.sync {
            cell.workStart()
        }
    }

    func setQueueFinishCell(cell: ArrayCollectionViewCell, titleCell: String) {
        queueMain.sync {
            cell.workFinish(title: titleCell)
        }
    }

    func setQueuesForCreateBigArrayData(
        collection: UICollectionView,
        indexPath: IndexPath,
        cell: ArrayCollectionViewCell
    ) {
        setQueueForStartCell(cell: cell)

        concurrentQueue.async { [weak self] in
            guard let self = self else { return }
            let timeOperation = self.createBigArray(indexPath: indexPath)
            self.queueMain.sync {
                if indexPath.section == 0 {
                    collection.reloadData()
                }
            }
            self.setQueueFinishCell(cell: cell, titleCell: timeOperation)
        }
    }

    func setQueueForOperations(indexPath: IndexPath, cell: ArrayCollectionViewCell) {
        var timeOperation = String()
        concurrentQueue.async { [weak self] in
            guard let self = self else { return }
            if indexPath.section == 1 {
                switch indexPath.row {
                case 0:
                    timeOperation = self.insertBeginOnce(indexPath: indexPath)
                case 1:
                    timeOperation = self.insertBeginOneTime(indexPath: indexPath)
                case 2:
                    timeOperation = self.insertMiddleOnce(indexPath: indexPath)
                case 3:
                    timeOperation = self.insertMiddleOneTime(indexPath: indexPath)
                case 4:
                    timeOperation = self.insertTheEndOnce(indexPath: indexPath)
                case 5:
                    timeOperation = self.insertTheEndOneTime(indexPath: indexPath)
                case 6:
                    timeOperation = self.removeBeginOnce(indexPath: indexPath)
                case 7:
                    timeOperation = self.removeBeginOneTime(indexPath: indexPath)
                case 8:
                    timeOperation = self.removeMiddleOnce(indexPath: indexPath)
                case 9:
                    timeOperation = self.removeMiddleOneTime(indexPath: indexPath)
                case 10:
                    timeOperation = self.removeTheEndOnce(indexPath: indexPath)
                case 11:
                    timeOperation = self.removeTheEndOneTime(indexPath: indexPath)
                default:
                    break
                }
            }
            self.setQueueFinishCell(cell: cell, titleCell: timeOperation)
        }

    }

    func setQueuesForOperationsWithBigArrayData(
        indexPath: IndexPath,
        cell: ArrayCollectionViewCell
    ) {
        var timeOperation = String()
        if !bigArrayData.isEmpty && indexPath.section != 0 {
            setQueueForStartCell(cell: cell)
            setQueueForOperations(indexPath: indexPath, cell: cell)
        } else {
            setQueueForStartCell(cell: cell)

            concurrentQueue.async { [weak self] in
                guard let self = self else { return }
                timeOperation = self.createBigArray(indexPath: indexPath)
                self.setQueueFinishCell(cell: cell, titleCell: timeOperation)
            }
        }
    }
}
