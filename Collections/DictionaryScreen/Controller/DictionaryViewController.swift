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
    private let viewModel = DictionaryViewModel()
    private let loadingView = LoadingView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.fetchData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.createCollections(completion: { [weak self] in
            guard let self = self else { return }
            self.loadingView.isHidden = true
            self.dataSource.viewModel = self.viewModel
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingView)
        loadingView.frame = view.frame
        registerCell()
        bind()
    }

    func registerCell() {
        collectionView.register(
            DictionaryCollectionViewCell.self,
            forCellWithReuseIdentifier: DictionaryCollectionViewCell.identifier
        )
    }

    func bind() {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        viewModel.onUpdateCellData = { [dataSource] data in
            dataSource.objects = data
        }
    }

}
