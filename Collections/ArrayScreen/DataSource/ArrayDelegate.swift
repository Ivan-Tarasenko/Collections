//
//  ArrayDelegate.swift
//  Collections
//
//  Created by Иван Тарасенко on 13.03.2022.
//

import UIKit

extension ArrayDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ArrayCollectionViewCell else { fatalError() }
        let queueMain = DispatchQueue.main
        let concurrentQueue = DispatchQueue(label: "CreateBigArrayQueue", attributes: .concurrent)
        var timeOperation = String()
        if bigArrayModel.bigArray.isEmpty {
            concurrentQueue.sync {
                cell.cellStart()
            }
            concurrentQueue.async { [self] in // We measure the array creation time
                timeOperation =  arrayModel.taskCompletionTime(string: "Time create Big Array") {
                    bigArrayModel.bigArray = Array(0...9_9)
                }
                queueMain.sync {
                    if indexPath.section == 0 {
                        collectionView.reloadData()    // Reload Collection View in main thread
                    }
                }
                queueMain.sync {
                    cell.cellFinish(title: timeOperation)
                    print(bigArrayModel.bigArray.count)
                }
            }
        } else {
            concurrentQueue.sync {
                cell.cellStart()
            }
            concurrentQueue.async { [self] in // We measure the array creation time
                if indexPath.section == 1 {

                    let addArray = Array(0...9)
                    let insetOperations = "Insert times"
                    let removeOpreations = "Remove time"
                    let middleBigArray = bigArrayModel.bigArray.count / 2

                    switch indexPath.row {
                    case 0:
                        timeOperation = arrayModel.taskCompletionTime(string: insetOperations, execute: {
                            bigArrayModel.bigArray.insert(contentsOf: addArray, at: 0)
                        })
                    case 1:
                        timeOperation = arrayModel.taskCompletionTime(string: insetOperations, execute: {
                            addArray.forEach({bigArrayModel.bigArray.insert($0, at: bigArrayModel.bigArray.startIndex)})
                        })
                    case 2:
                        timeOperation = arrayModel.taskCompletionTime(string: insetOperations, execute: {
                            bigArrayModel.bigArray.insert(contentsOf: addArray, at: middleBigArray)
                        })
                    case 3:
                        timeOperation = arrayModel.taskCompletionTime(string: insetOperations, execute: {
                            addArray.forEach({bigArrayModel.bigArray.insert($0, at: middleBigArray)})
                        })
                    case 4:
                        timeOperation = arrayModel.taskCompletionTime(string: insetOperations, execute: {
                            bigArrayModel.bigArray += addArray
                        })
                    case 5:
                        timeOperation = arrayModel.taskCompletionTime(string: insetOperations, execute: {
                            addArray.forEach({bigArrayModel.bigArray.insert($0, at: bigArrayModel.bigArray.endIndex)})
                        })
                    case 6:
                        timeOperation = arrayModel.taskCompletionTime(string: removeOpreations, execute: {
                            bigArrayModel.bigArray.removeFirst(10)
                            print(bigArrayModel.bigArray)
                        })
                    case 7:
                        timeOperation = arrayModel.taskCompletionTime(string: removeOpreations, execute: {
                            for element in addArray {
                                bigArrayModel.bigArray.removeFirst(element)
                                print(bigArrayModel.bigArray)
                            }
                        })
                    case 8:
                        timeOperation = arrayModel.taskCompletionTime(string: removeOpreations, execute: {
                            bigArrayModel.bigArray.removeSubrange(middleBigArray...middleBigArray + 9)
                            print(bigArrayModel.bigArray)
                        })
                    case 9:
                        timeOperation = arrayModel.taskCompletionTime(string: removeOpreations, execute: {
                            for element in addArray {
                                bigArrayModel.bigArray.remove(at: middleBigArray + element) // race conditon
                                print(bigArrayModel.bigArray)
                            }
                        })
                    case 10:
                        timeOperation = arrayModel.taskCompletionTime(string: removeOpreations, execute: {
                            bigArrayModel.bigArray.removeLast(10)
                            print(bigArrayModel.bigArray)
                        })
                    case 11:
                        timeOperation = arrayModel.taskCompletionTime(string: removeOpreations, execute: {
                            for element in addArray {
                                bigArrayModel.bigArray.removeLast(element)
                                print(bigArrayModel.bigArray)
                            }
                        })
                    default:
                        break
                    }
                }
                queueMain.sync {
                    cell.cellFinish(title: timeOperation)
                    print(bigArrayModel.bigArray.count)
                }
            }
        }
    }
}
