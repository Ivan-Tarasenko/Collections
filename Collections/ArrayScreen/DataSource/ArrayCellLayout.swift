//
//  ArrayCellLayout.swift
//  Collections
//
//  Created by Иван Тарасенко on 13.03.2022.
//

import UIKit

extension ArrayDataSource: UICollectionViewDelegateFlowLayout {

    /// here you can set the size for the cells of different sections
    /// - Parameters:
    ///   - collectionView: ArrayCollectionView
    ///   - indexPath: For cell zero section and other cells
    /// - Returns: Size width and height cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        var heightDivider: CGFloat = 0.0
        var itemsPerRow: CGFloat = 0.0
        let sectionInsert = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)

        if indexPath.section == 0 {
            heightDivider = 3
            itemsPerRow = 1
        } else {
            heightDivider = 2
            itemsPerRow = 2
        }
        let paddingWidth = sectionInsert.left * (itemsPerRow + 1)
        let availabelWidth = collectionView.frame.width - paddingWidth
        let withPerItem = availabelWidth / itemsPerRow
        let heightPerItem = withPerItem / heightDivider
        return   CGSize(width: withPerItem, height: heightPerItem)

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
