//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class DictionaryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private let dataSource = DictionaryDaraSource()
    private let viewModel = DictionaryViewModel()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewModel.arrayContacts.isEmpty {
            activityIndicator.startAnimating()
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.collectionViewLayout = collectionView.flowLayout
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
