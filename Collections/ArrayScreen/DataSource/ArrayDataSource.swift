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

    private let sectionInsert = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    private let heightSpacingBetweenCells: CGFloat = 0

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArrayCollectionViewCell.identifier,
            for: indexPath) as? ArrayCollectionViewCell else { fatalError() }

        let object = objects[indexPath.row]

        cell.settingDataCell(data: object)
    
        return cell
    }
}

// MARK: - Delegate for ArrayViewController
extension ArrayDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        viewModel.performOperations(indexPath: indexPath) {
            collectionView.reloadItems(at: [indexPath])
        }
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
        let numberOfRows: CGFloat = 7

        if indexPath.item == 0 {  // Setting the number of items in rows
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
        return sectionInsert.left
    }
}
