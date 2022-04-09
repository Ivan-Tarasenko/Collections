//
//  DictionaryDataSource.swift
//  Collections
//
//  Created by Иван Тарасенко on 27.03.2022.
//

import Foundation
import UIKit

class DictionaryDaraSource: NSObject, UICollectionViewDataSource {

    var objects = [DictionaryCollectionModel]()
    let viewModel = DictionaryViewModel()

    private let sectionInsert = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count * 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DictionaryCollectionViewCell.identifier,
            for: indexPath) as? DictionaryCollectionViewCell else { fatalError() }

        var objects: [Any] = objects
        viewModel.doublesArray(sequence: &objects)

        let object = objects[indexPath.row]
        switch indexPath.row {
        case 0...1 :
            cell.settingDataCell(data: (object as? DictionaryCollectionModel)!)
            cell.settingTheStyleForDifferentCells = true
        case 2...3 :
            cell.settingDataCell(data: (object as? DictionaryCollectionModel)!)
            cell.settingTheStyleForDifferentCells = true
        case 4...5 :
            cell.settingDataCell(data: (object as? DictionaryCollectionModel)!)
            cell.settingTheStyleForDifferentCells = true
        default:
            break
        }

        return cell
    }

}

extension DictionaryDaraSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as?
                DictionaryCollectionViewCell else { fatalError() }
    }
}

extension DictionaryDaraSource: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.safeAreaLayoutGuide.layoutFrame.size.width

        var heightDivider: CGFloat = 0
        let numberOfItemsPerRow: CGFloat = 2

        if UIDevice.current.orientation.isLandscape {
            heightDivider = 4
        } else {
            heightDivider = 2
        }

        let spacingWidth: CGFloat = sectionInsert.left
        let availableWidth = width - spacingWidth * (numberOfItemsPerRow + 1)
        let widthItem = floor(availableWidth / numberOfItemsPerRow)
        let heightItem = widthItem / heightDivider

        return CGSize(width: widthItem, height: heightItem)
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

    // Regester header collectionView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let reusableview = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "header", for: indexPath) as? HeaderDictionary else { fatalError() }

            reusableview.setHeaderArray()
            reusableview.setHeaderDictionary()
            return reusableview

        default:  fatalError("Unexpected element kind")
        }
    }
}
