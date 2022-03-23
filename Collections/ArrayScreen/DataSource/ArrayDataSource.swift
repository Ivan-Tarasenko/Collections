//
//  ArrayDataSource.swift
//  Collections
//
//  Created by Иван Тарасенко on 12.03.2022.
//

import UIKit

class ArrayDataSource: NSObject, UICollectionViewDataSource {

    var objects = [ArrayCollectionModel]()
    private let viewModel = ArrayViewModel()
    private let sectionInsert = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.bigArray.isEmpty ? 1 : 2
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

        if viewModel.bigArray.isEmpty {
            concurrentQueue.sync {      
                cell.workStart()
            }

            concurrentQueue.async { [self] in // We measure the array creation time
                timeOperation = viewModel.createBigArray()
                print(viewModel.bigArray.count)

                queueMain.sync {
                    if indexPath.section == 0 {
                        collectionView.reloadData()    // Reload Collection View in main thread
                    }
                }

                queueMain.sync {
                    cell.workFinish(title: timeOperation)
                }
            }
            cell.label.text = timeOperation
        } else {

            concurrentQueue.sync {
                cell.workStart()
            }
            concurrentQueue.async { [self] in // We measure the array creation time
                if indexPath.section == 1 {
                    switch indexPath.row {
                    case 0:
                        timeOperation = viewModel.insertBeginOnce()
                    case 1:
                        timeOperation = viewModel.insertBeginOneTime()
                    case 2:
                        timeOperation = viewModel.insertMiddleOnce()
                    case 3:
                        timeOperation = viewModel.insertMiddleOneTime()
                    case 4:
                        timeOperation = viewModel.insertTheEndOnce()
                    case 5:
                        timeOperation = viewModel.insertTheEndOneTime()
                    case 6:
                        timeOperation = viewModel.removeBeginOnce()
                    case 7:
                        timeOperation = viewModel.removeBeginOneTime()
                    case 8:
                        timeOperation = viewModel.removeMiddleOnce()
                    case 9:
                        timeOperation = viewModel.removeMiddleOneTime()
                    case 10:
                        timeOperation = viewModel.removeTheEndOnce()
                    case 11:
                        timeOperation = viewModel.removeTheEndOneTime()
                    default:
                        break
                    }
                }
                queueMain.sync {
                    cell.workFinish(title: timeOperation)
                }
            }
        }
        print("section: \(indexPath.section) cell: \(indexPath.row)")
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
