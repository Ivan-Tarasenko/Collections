//
//  ArrayDataSource.swift
//  Collections
//
//  Created by Иван Тарасенко on 12.03.2022.
//

import UIKit

class ArrayDataSource: NSObject, UICollectionViewDataSource {

    var objects = [ArrayCollectionModel]()
    let bigArrayModel = BigArrayModel()
    private let viewModel = ArrayViewModel()
    private let sectionInsert = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return bigArrayModel.bigArray.isEmpty ? 1 : 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            objects.remove(at: 0)
            return objects.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArrayCollectionViewCell.identifier,
            for: indexPath) as? ArrayCollectionViewCell else { fatalError() }

        let object = objects[indexPath.row]

        if indexPath.section == 0 {
            cell.settingDataCell(data: object)            // Set title big array
            cell.settingTheStyleForDifferentCells = true
        } else {
            cell.settingDataCell(data: object)           // Set title other cell
            cell.settingTheStyleForDifferentCells = false
        }
        return cell
    }
}

// MARK: - Delegate for ArrayViewController
extension ArrayDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ArrayCollectionViewCell else { fatalError() }
        let queueMain = DispatchQueue.main
        let concurrentQueue = DispatchQueue(label: "CreateBigArrayQueue", attributes: .concurrent)
        var timeOperation = String()
        //
        if bigArrayModel.bigArray.isEmpty {
            concurrentQueue.sync {
                cell.cellStart()
            }
            concurrentQueue.async { [self] in // We measure the array creation time
                timeOperation =  viewModel.taskCompletionTime(string: "Time create Big Array") {
                    bigArrayModel.bigArray = Array(0...9_999_)
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
                        timeOperation = viewModel.taskCompletionTime(string: insetOperations, execute: {
                            bigArrayModel.bigArray.insert(contentsOf: addArray, at: 0)
                        })
                    case 1:
                        timeOperation = viewModel.taskCompletionTime(string: insetOperations, execute: {
                            addArray.forEach({bigArrayModel.bigArray.insert($0, at: bigArrayModel.bigArray.startIndex)})
                        })
                    case 2:
                        timeOperation = viewModel.taskCompletionTime(string: insetOperations, execute: {
                            bigArrayModel.bigArray.insert(contentsOf: addArray, at: middleBigArray)
                        })
                    case 3:
                        timeOperation = viewModel.taskCompletionTime(string: insetOperations, execute: {
                            addArray.forEach({bigArrayModel.bigArray.insert($0, at: middleBigArray)})
                        })
                    case 4:
                        timeOperation = viewModel.taskCompletionTime(string: insetOperations, execute: {
                            bigArrayModel.bigArray += addArray
                        })
                    case 5:
                        timeOperation = viewModel.taskCompletionTime(string: insetOperations, execute: {
                            addArray.forEach({bigArrayModel.bigArray.insert($0, at: bigArrayModel.bigArray.endIndex)})
                        })
                    case 6:
                        timeOperation = viewModel.taskCompletionTime(string: removeOpreations, execute: {
                            bigArrayModel.bigArray.removeFirst(10)
                            print(bigArrayModel.bigArray)
                        })
                    case 7:
                        timeOperation = viewModel.taskCompletionTime(string: removeOpreations, execute: {
                            for element in addArray {
                                bigArrayModel.bigArray.removeFirst(element)
                                print(bigArrayModel.bigArray)
                            }
                        })
                    case 8:
                        timeOperation = viewModel.taskCompletionTime(string: removeOpreations, execute: {
                            bigArrayModel.bigArray.removeSubrange(middleBigArray...middleBigArray + 9)
                            print(bigArrayModel.bigArray)
                        })
                    case 9:
                        timeOperation = viewModel.taskCompletionTime(string: removeOpreations, execute: {
                            for element in addArray {
                                bigArrayModel.bigArray.remove(at: middleBigArray + element) // race conditon
                                print(bigArrayModel.bigArray)
                            }
                        })
                    case 10:
                        timeOperation = viewModel.taskCompletionTime(string: removeOpreations, execute: {
                            bigArrayModel.bigArray.removeLast(10)
                            print(bigArrayModel.bigArray)
                        })
                    case 11:
                        timeOperation = viewModel.taskCompletionTime(string: removeOpreations, execute: {
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

// MARK: - Flow layout for ArrayCollectionView
extension ArrayDataSource: UICollectionViewDelegateFlowLayout {

    /// here you can set the size for the cells of different sections
    /// - Parameters:
    ///   - collectionView: ArrayCollectionView
    ///   - indexPath: For cell zero section and other cells
    /// - Returns: Size width and height cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        var numberOfItemsPerRow: CGFloat = 0
        var heightDivider: CGFloat = 0

        if indexPath.section == 0 {
            numberOfItemsPerRow = 1
            heightDivider = 3
        } else {
            numberOfItemsPerRow = 2
            heightDivider = 2
        }

        let width = collectionView.bounds.width
        let spacing: CGFloat = sectionInsert.left
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let widthItem = floor(availableWidth / numberOfItemsPerRow)
        let hightItem = widthItem / heightDivider
        return CGSize(width: widthItem, height: hightItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsert
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
