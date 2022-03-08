//
//  ArrayCollectionView+Layout.swift
//  Collections
//
//  Created by Иван Тарасенко on 08.03.2022.
//

import UIKit

extension ArrayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.section == 0 {
            heightDivider = 3
            itemsPerRow = 1
        } else {
            heightDivider = 2
            itemsPerRow = 2
        }

        let paddingWigth = sectionInsert.left * (itemsPerRow + 1)
        let avialabelWigth = collectionView.frame.width - paddingWigth
        let withPerItem = avialabelWigth / itemsPerRow
        let heightPerItem = withPerItem / heightDivider
        return   CGSize(width: withPerItem, height: heightPerItem)

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
