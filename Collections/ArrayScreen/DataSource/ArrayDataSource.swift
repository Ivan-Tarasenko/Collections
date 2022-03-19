//
//  ArrayDataSource.swift
//  Collections
//
//  Created by Иван Тарасенко on 12.03.2022.
//

import UIKit

class ArrayDataSource: NSObject, UICollectionViewDataSource {

    var object = [ArrayCollectionViewData]()
    let bigArrayModel = BigArrayModel()
    let arrayModel = ArrayModel()
//    let workingCell = WorkingCell()

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return bigArrayModel.bigArray.isEmpty ? 1 : 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            object.remove(at: 0)
            return object.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArrayCollectionViewCell.identifier,
            for: indexPath) as? ArrayCollectionViewCell else { fatalError() }

        let object = object[indexPath.row]

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
