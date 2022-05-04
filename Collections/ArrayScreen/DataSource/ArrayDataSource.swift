//
//  ArrayDataSource.swift
//  Collections
//
//  Created by Иван Тарасенко on 12.03.2022.
//

import UIKit

class ArrayDataSource: NSObject, UICollectionViewDataSource {

    var objects: [ArrayCollectionModel] = []
    var viewModel = ArrayViewModel()

    private let sectionInsert = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
    private let heightSpacingBetweenCells: CGFloat = 0

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.bigArrayData.isEmpty ? 1 : 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItemsInSection: [Any] = objects
        if section == 0 {
            return 1
        } else {
            viewModel.removeFirstIndex(sequence: &numberOfItemsInSection)
            return numberOfItemsInSection.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArrayCollectionViewCell.identifier,
            for: indexPath) as? ArrayCollectionViewCell else { fatalError() }
        var objects: [Any] = objects

        if indexPath.section != 0 {
            viewModel.removeFirstIndex(sequence: &objects)
        }

        let object = objects[indexPath.row]

        if indexPath.section == 0 && indexPath.row == 0 {
            cell.settingDataCell(data: (object as? ArrayCollectionModel)!)   // Set title big array
            cell.settingLabelForBigArray()
        } else {
//            print("if section != 0 section: \(indexPath.section) item: \(indexPath.row)")
            cell.settingDataCell(data: (object as? ArrayCollectionModel)!)   // Set title other cell
        }
        return cell
    }
}

// MARK: - Delegate for ArrayViewController
extension ArrayDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if viewModel.bigArrayData.isEmpty {
            print(viewModel.cellData[indexPath.row].isPerfoming)
            print(viewModel.cellData[indexPath.row].isDone)
            viewModel.fillBigArray(indexPath: indexPath) {
                collectionView.reloadData()
                print(self.viewModel.cellData[indexPath.row].isPerfoming)
                print(self.viewModel.cellData[indexPath.row].isDone)
            }
        } else {
            print("big data data sours is perform \(viewModel.cellData[indexPath.row].isPerfoming)")
            print("big data data sours is done \(viewModel.cellData[indexPath.row].isDone)")
            viewModel.fillBigArray(indexPath: indexPath) {
                collectionView.reloadItems(at: [indexPath])
            }

            viewModel.performOperations(indexPath: indexPath) {
                collectionView.reloadItems(at: [indexPath])
            }
        }

        print("в не  sours is perform \(viewModel.cellData[indexPath.row].isPerfoming)")
        print("в не sours is done \(viewModel.cellData[indexPath.row].isDone)")

//        if indexPath.section != 0 {
//            print("in data sours is perform \(viewModel.cellData[indexPath.row].isPerfoming)")
//            print("in data sours is done \(viewModel.cellData[indexPath.row].isDone)")
//            viewModel.performOperations(indexPath: indexPath) {
//                collectionView.reloadItems(at: [indexPath])
//            }
//        }

        collectionView.reloadItems(at: [indexPath])

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
        var numberOfRows: CGFloat = 0

        if objects.count % 2 != 0 {    // determine the number of rows
            numberOfRows = CGFloat((objects.count  / 2) + 1)
        } else {
            numberOfRows = CGFloat(objects.count  / 2)
        }

        if indexPath.section == 0 {  // Setting the number of items in rows
            numberOfItemsPerRow = 1
        } else {
            numberOfItemsPerRow = 2
        }
        // Determining the dynamic size collectionView. Width and Height
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.size.width
        let height = collectionView.safeAreaLayoutGuide.layoutFrame.size.height

        // Setting the dynamic width of the element at specified intervals
        let spacingWidth: CGFloat = sectionInsert.left
        let availableWidth = width - spacingWidth * (numberOfItemsPerRow + 1)
        let widthItem = floor(availableWidth / numberOfItemsPerRow)

        // Setting the dynamic height of the element at specified intervals
        let heightSpacingBetweenSections: CGFloat = sectionInsert.top
        let heightSpacingBetweenCell = heightSpacingBetweenCells * numberOfRows
        let availableHeight = height - heightSpacingBetweenSections - heightSpacingBetweenCell
        let heightItem = availableHeight / numberOfRows

        return CGSize(width: widthItem, height: heightItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsert
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return heightSpacingBetweenCells
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
