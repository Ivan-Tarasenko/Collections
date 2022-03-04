//
//  ArrayViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class ArrayViewController: UICollectionViewController {

    let titleBigArray = NSLocalizedString("titleBigArray", comment: "")

    let insertBeginOnce = NSLocalizedString("insertBeginOnce", comment: "")
    let insertBeginOneTime = NSLocalizedString("insertBeginOneTime", comment: "")
    let insertMiddleOnce = NSLocalizedString("insertMiddleOnce", comment: "")
    let insertMiddleOneTime = NSLocalizedString("insertMiddleOneTime", comment: "")
    let insertTheEndOnce = NSLocalizedString("insertTheEndOnce", comment: "")
    let insertTheEndOneTime = NSLocalizedString("insertTheEndOneTime", comment: "")
    let removeBeginOnce = NSLocalizedString("removeBeginOnce", comment: "")
    let removeBeginOneTime = NSLocalizedString("removeBeginOneTime", comment: "")
    let removeMiddleOnce = NSLocalizedString("removeMiddleOnce", comment: "")
    let removeMiddleOneTime = NSLocalizedString("removeMiddleOneTime", comment: "")
    let removeTheEndOnce = NSLocalizedString("removeTheEndOnce", comment: "")
    let removeTheEndOneTime = NSLocalizedString("removeTheEndOneTime", comment: "")
// Variable cell sizes.
    var heightDivider: CGFloat = 0.0
    var itemsPerRow: CGFloat = 0.0
    let sectionInsert = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)

    var nameCell = [CollectionViewNameCell]()
    var bigArray = [Int]()
    let layoutCell = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        getNameCollectionView()
        registerXibCell()
//        bigArray = Array(0...9999)

        collectionView.collectionViewLayout = layoutCell
    }
    func registerXibCell() {
        collectionView.register(UINib(nibName: "CustomXibCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "xibCell")
    }

    func getNameCollectionView() {
        nameCell = [CollectionViewNameCell(nameCell: insertBeginOnce),
                    CollectionViewNameCell(nameCell: insertBeginOneTime),
                    CollectionViewNameCell(nameCell: insertMiddleOnce),
                    CollectionViewNameCell(nameCell: insertMiddleOneTime),
                    CollectionViewNameCell(nameCell: insertTheEndOnce),
                    CollectionViewNameCell(nameCell: insertTheEndOneTime),
                    CollectionViewNameCell(nameCell: removeBeginOnce),
                    CollectionViewNameCell(nameCell: removeBeginOneTime),
                    CollectionViewNameCell(nameCell: removeMiddleOnce),
                    CollectionViewNameCell(nameCell: removeMiddleOneTime),
                    CollectionViewNameCell(nameCell: removeTheEndOnce),
                    CollectionViewNameCell(nameCell: removeTheEndOneTime)
        ]
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return bigArray.isEmpty ? 1 : 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : nameCell.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "xibCell",
            for: indexPath) as? CustomXibCollectionViewCell else { fatalError() }

        let name = nameCell[indexPath.row]
        cell.backgroundColor = .systemGray4
        cell.layer.borderWidth = 0.5
        cell.nameCellLabel.textColor = .systemBlue

        if indexPath.section == 0 {
            cell.nameCellLabel.textTitle = titleBigArray
            cell.nameCellLabel.textAlignment = .center
        } else {
            cell.nameCellLabel.textTitle = "\(name.nameCell)"
        }

        return cell
    }
}

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
