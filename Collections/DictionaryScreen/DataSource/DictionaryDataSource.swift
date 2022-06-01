//
//  DictionaryDataSource.swift
//  Collections
//
//  Created by Иван Тарасенко on 27.03.2022.
//

import Foundation
import UIKit

class DictionaryDaraSource: NSObject, UICollectionViewDataSource {

    var viewModel = DictionaryViewModel()
    var objects: [DictionaryCollectionModel] = [] {
        didSet {
        }
    }

    private let sectionInsert = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        print(objects.count)
        return objects.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DictionaryCollectionViewCell.identifier,
            for: indexPath) as? DictionaryCollectionViewCell else { fatalError() }

        let object = objects[indexPath.row]
        cell.settingDataCell(data: object)
        return cell
    }

}

extension DictionaryDaraSource: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        viewModel.perfomingOperations(indexPath: indexPath) {
            collectionView.reloadItems(at: [indexPath])
        }
        collectionView.reloadItems(at: [indexPath])
    }
}

extension DictionaryDaraSource: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.safeAreaLayoutGuide.layoutFrame.size.width

        var heightDivider: CGFloat = 0
        let numberOfItemsPerRow: CGFloat = 2

        heightDivider = UIDevice.current.orientation.isLandscape ? 4 : 2

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
