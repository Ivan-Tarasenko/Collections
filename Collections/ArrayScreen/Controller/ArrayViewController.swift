//
//  ArrayViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class ArrayViewController: UIViewController {

    @IBOutlet weak var colletctionView: UICollectionView!

    let arrayViewModel = ArrayViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        arrayViewModel.bigArray = Array(0...9_999)
        arrayViewModel.fetchArrayData()
        colletctionView.register(ArrayCollectionViewCell.self, forCellWithReuseIdentifier: ArrayCollectionViewCell.identifier)
    }
}

extension ArrayViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

     func numberOfSections(in collectionView: UICollectionView) -> Int {
         return arrayViewModel.bigArray.isEmpty ? 1 : 2
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : arrayViewModel.dataArray.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArrayCollectionViewCell.identifier,
            for: indexPath) as? ArrayCollectionViewCell else { fatalError() }

        let name = arrayViewModel.dataArray[indexPath.row]
        cell.backgroundColor = .systemGray4
        cell.layer.borderWidth = 0.5

        if indexPath.section == 0 {
            cell.label.textTitle = arrayViewModel.titleBigArray
            cell.label.textAlignment = .center
        } else {
            cell.setArrayCell(data: name)
        }

         if arrayViewModel.bigArray.isEmpty {
            cell.label.textColor = .systemBlue
        } else {
            cell.label.textColor = .black
            cell.backgroundColor = .white
        }

        return cell
    }

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

        let paddingWigth = sectionInsert.left * (itemsPerRow + 1)
        let avialabelWigth = collectionView.frame.width - paddingWigth
        let withPerItem = avialabelWigth / itemsPerRow
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
