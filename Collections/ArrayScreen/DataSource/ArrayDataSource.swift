//
//  ArrayDataSource.swift
//  Collections
//
//  Created by Иван Тарасенко on 12.03.2022.
//

import UIKit

class ArrayDataSource: NSObject, UICollectionViewDataSource {

    var object = [ArrayCollectionViewData]()
    private let bigArrayModel = BigArrayModel()

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        bigArrayModel.bigArray = Array(0...999)                                 // creating big array for testing interface
        return bigArrayModel.bigArray.isEmpty ? 1 : 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : object.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArrayCollectionViewCell.identifier,
            for: indexPath) as? ArrayCollectionViewCell else { fatalError() }
        let titleBigArray = NSLocalizedString("titleBigArray", comment: "")

        let object = object[indexPath.row]
        cell.backgroundColor = .systemGray4
        cell.layer.borderWidth = 0.5

        if indexPath.section == 0 {
            cell.label.textTitle = titleBigArray     // Set title big array
            cell.label.textAlignment = .center
        } else {
            cell.backgroundColor = .red
            cell.setArrayCell(data: object)         // Set title other cell
        }

        if bigArrayModel.bigArray.isEmpty {
            cell.label.textColor = .systemBlue
        } else {
            cell.label.textColor = .black
            cell.backgroundColor = .white
        }

        return cell
    }
}
