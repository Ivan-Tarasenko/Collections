//
//  ArrayViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class ArrayViewController: UIViewController {

    var heightDivider: CGFloat = 0.0
    var itemsPerRow: CGFloat = 0.0
    let sectionInsert = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)

    let getNameCell = ExtractionNameForCollectionCell()

    var bigArray = [Int]()
//    let layout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        getNameCell.getNameCollectionView()
        collectionView.register(UINib(nibName: "CustomXibCollectionViewCell", bundle: nil),
                                       forCellWithReuseIdentifier: "xibCell")
//        registerXibCell()
//        bigArray = Array(0...9999)

//        collectionView.collectionViewLayout = layout
    }
//    func registerXibCell() {
//        collectionView.register(UINib(nibName: "CustomXibCollectionViewCell", bundle: nil),
//                                forCellWithReuseIdentifier: "xibCell")
//    }
}

extension ArrayViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return bigArray.isEmpty ? 1 : 2
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : getNameCell.nameCell.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
