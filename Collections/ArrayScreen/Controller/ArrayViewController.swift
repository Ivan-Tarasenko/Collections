//
//  ArrayViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class ArrayViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private let dataSource = ArrayDataSource()
    private let viewModel = ArrayViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        bind()
    }

    func registerCell() {
        collectionView.register(
            ArrayCollectionViewCell.self,
            forCellWithReuseIdentifier: ArrayCollectionViewCell.identifier
        )
    }

    func bind() {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        dataSource.object = viewModel.cellData
    }
}
