//
//  ArrayViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 13.03.2022.
//

import Foundation
import UIKit

class ArrayViewModel {

    var onUpdateCellData: (([ArrayCollectionModel]) -> Void)?

    var bigArrayData = [Int]()
    let arrayOfThousandInt = Array(0...999)

    let queueMain = DispatchQueue.main
    let concurrentQueue = DispatchQueue(label: "CreateBigArrayQueue", attributes: .concurrent)
    
    private(set) var cellData: [ArrayCollectionModel] = [] {
        didSet {
            onUpdateCellData?(cellData)
        }
    }

    private var dataManager = ArrayDataManager.shared

    init() {
        cellData = dataManager.fetchArrayData()
    }

    func removeFirstIndex(sequence: inout [Any]) {
        sequence.remove(at: 0)
    }

    // Method for determining the algorithm execution speed.
    func taskCompletionTime (execute: () -> Void ) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        execute()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        let timeElapsedDouble = Double(timeElapsed)
        let answer = (round(1000 * timeElapsedDouble) / 1000)
        return answer
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
        let title = updateCell(indexPathCell: indexPath)
        let crateArray = taskCompletionTime {
            for int in 0...9_999_999 {
                array.append(int)
            }
        }
        bigArrayData = array
        return "\(title) \(crateArray) ms."
    }
    
    // MARK: - Functions adding and removing elements in big array
    
    // Inserting 1000 elements at the beginning of the array at once
    func insertBeginOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime {
            array.insert(contentsOf: arrayOfThousandInt, at: 0)
        }
        bigArrayData = array
        return "\(title) \(insetTitle) ms."
    }

    // Inserting 1000 elements at the beginning of the array one at a time
    func insertBeginOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime {
            for int in arrayOfThousandInt {
                array.insert(int, at: array.startIndex)
            }
        }
        bigArrayData = array
        return "\(title) \(insetTitle) ms."
    }

    // Inserting 1000 elements into the middle of the array at once
    func insertMiddleOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime {
            array.insert(contentsOf: arrayOfThousandInt, at: array.count / 2)
        }
        bigArrayData = array
        return "\(title) \(insetTitle) ms."
    }

    // Inserting 1000 elements into the middle of the array one at a time
    func insertMiddleOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime {
            for element in arrayOfThousandInt {
                array.insert(element, at: array.count / 2 )
            }
        }
        bigArrayData = array
        return "\(title) \(insetTitle) ms."
    }

    // Inserting 1000 elements at the end of the array at once
    func insertTheEndOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime {
            array += arrayOfThousandInt
        }
        bigArrayData = array
        return "\(title) \(insetTitle) ms"
    }

    // Inserting 1000 elements at the end of the array one at a time
    func insertTheEndOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let insetTitle = taskCompletionTime {
            for element in arrayOfThousandInt {
                array.insert(element, at: array.endIndex)
            }
        }
        bigArrayData = array
        return "\(title) \(insetTitle) ms."
    }

    // Removing 1000 elements from the beginning of the array at once
    func removeBeginOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let removeTitle = taskCompletionTime {
            array.removeFirst(arrayOfThousandInt.count)
        }
        bigArrayData = array
        return "\(title) \(removeTitle) ms."
    }

    // Removing 1000 elements from the beginning of the array one at a time
    func removeBeginOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let removeTitle = taskCompletionTime {
            for element in arrayOfThousandInt {
                array.remove(at: element)
            }
        }
        bigArrayData = array
        return "\(title) \(removeTitle) ms."
    }

    // Removing 1000 elements from the middle of the array at once
    func removeMiddleOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let range = (array.count / 2)...((array.count / 2) + (arrayOfThousandInt.count - 1))
        let removeTitle = taskCompletionTime {
            array.removeSubrange(range)
        }
        bigArrayData = array
        return "\(title) \(removeTitle) ms."
    }

    // Removing 1000 elements from the middle of the array one at a time
    func removeMiddleOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let removeTitle = taskCompletionTime {
            for element in arrayOfThousandInt {
                array.remove(at: (array.count / 2) + element)
            }
        }
        bigArrayData = array
        return "\(title) \(removeTitle) ms."
    }

    // Removing 1000 elements from the end of the array at once"
    func removeTheEndOnce(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let removeTitle = taskCompletionTime {
            array.removeLast(arrayOfThousandInt.count)
        }
        bigArrayData = array
        return "\(title) \(removeTitle) ms."
    }
    
    // Removing 1000 elements from the end of the array one at a time
    func removeTheEndOneTime(indexPath: IndexPath) -> String {
        var array = bigArrayData
        let title = updateCell(indexPathCell: indexPath)
        let removeTitle = taskCompletionTime {
            for _ in arrayOfThousandInt {
                array.removeLast()
            }
        }
        bigArrayData = array
        return "\(title) \(removeTitle) ms."
    }

    // MARK: - Working with threads

    func fillBigArray(indexPath: IndexPath, completion: @escaping () -> Void) {

        cellData[indexPath.row].isPerfoming = true

        concurrentQueue.async { [weak self] in
            guard let self = self else { return }
            let timeOperation = self.createBigArray(indexPath: indexPath)

            self.queueMain.async {
                self.cellData[indexPath.row].title = timeOperation
                completion()
            }
        }
    }

    func performOperations(indexPath: IndexPath, completion: @escaping () -> Void) {

        cellData[indexPath.row].isPerfoming = true

        var timeOperation = String()

        concurrentQueue.async { [weak self] in
            guard let self = self else { return }
            if indexPath.section != 0 {
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
            self.queueMain.sync {
                self.cellData[indexPath.row].title = timeOperation
                completion()
            }
        }
    }
}
