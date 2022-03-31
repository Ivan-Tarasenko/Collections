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
    private let sectionInsert = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
    private let heightSpacingBetweenCells: CGFloat = 0

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.bigArrayData.isEmpty ? 1 : 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItemsInSection = objects
        if section == 0 {
            return 1
        } else {
            numberOfItemsInSection.remove(at: 0)
            return numberOfItemsInSection.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArrayCollectionViewCell.identifier,
            for: indexPath) as? ArrayCollectionViewCell else { fatalError() }

        var objects = objects

        if indexPath.section != 0 {
            objects.remove(at: 0)
        }

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
        guard let cell = collectionView.cellForItem(
            at: indexPath) as? ArrayCollectionViewCell else { fatalError() }

        if viewModel.bigArrayData.isEmpty {
            viewModel.setQueuesForCreateBigArrayData(
                collection: collectionView,
                indexPath: indexPath,
                cell: cell
            )
        }
        
        viewModel.setQueuesForOperationsWithBigArrayData(indexPath: indexPath, cell: cell)
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

        if objects.count % 2 != 0 {
            numberOfRows = CGFloat((objects.count  / 2) + 1)
        } else {
            numberOfRows = CGFloat(objects.count  / 2)
        }

        if indexPath.section == 0 {
            numberOfItemsPerRow = 1
        } else {
            numberOfItemsPerRow = 2
        }

        let height = collectionView.safeAreaLayoutGuide.layoutFrame.size.height
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.size.width

        let spacingWidth: CGFloat = sectionInsert.left
        let availableWidth = width - spacingWidth * (numberOfItemsPerRow + 1)
        let widthItem = floor(availableWidth / numberOfItemsPerRow)

        let heightSpacingBetweenSections: CGFloat = sectionInsert.top
        let heightSpacingBetweenCell = heightSpacingBetweenCells * numberOfRows
        let availableHeight = height - heightSpacingBetweenSections - heightSpacingBetweenCell
        let heightItem = availableHeight / numberOfRows

        print("width screen: \(width) width item: \(widthItem)")

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
