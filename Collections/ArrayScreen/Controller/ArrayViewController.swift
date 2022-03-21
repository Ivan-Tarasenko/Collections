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

    let layout = CollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = layout
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
        dataSource.objects = viewModel.cellData
    }
}
