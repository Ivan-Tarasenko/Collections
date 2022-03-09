//
//  ArrayVC+DataSours.swift
//  Collections
//
//  Created by Иван Тарасенко on 09.03.2022.
//

import UIKit

extension ArrayViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return bigArray.isEmpty ? 1 : 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : getNameCell.nameCell.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "xibCell",
            for: indexPath) as? CustomXibCollectionViewCell else { fatalError() }

        let name = getNameCell.nameCell[indexPath.row]
        cell.backgroundColor = .systemGray4
        cell.layer.borderWidth = 0.5

        if indexPath.section == 0 {
            cell.nameCellLabel.textTitle = getNameCell.titleBigArray
            cell.nameCellLabel.textAlignment = .center
        } else {
            cell.nameCellLabel.textTitle = "\(name.nameCell)"
        }

        if bigArray.isEmpty {
            cell.nameCellLabel.textColor = .systemBlue
        } else {
            cell.nameCellLabel.textColor = .black
            cell.backgroundColor = .white
        }

        return cell
    }
}
