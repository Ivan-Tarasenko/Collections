//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class DictionaryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private let dataSource = DictionaryDaraSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       registerCell()
        bind()
    }

    func registerCell() {
        collectionView.register(DictionaryCollectionViewCell.self, forCellWithReuseIdentifier: DictionaryCollectionViewCell.identifier)
    }

    func bind() {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
//        dataSource.objects = viewModel.cellData
    }
}
