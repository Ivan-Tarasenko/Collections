//
//  ArrayViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class ArrayViewController: UICollectionViewController {

    var heightDivider: CGFloat = 0.0
    var itemsPerRow: CGFloat = 0.0
    let sectionInsert = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)

    let getNameCell = ExtractionNameForCollectionCell()

    var bigArray = [Int]()
    let layout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        getNameCell.getNameCollectionView()
        registerXibCell()
//        bigArray = Array(0...9999)

        collectionView.collectionViewLayout = layout
    }
    func registerXibCell() {
        collectionView.register(UINib(nibName: "CustomXibCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "xibCell")
    }
}
