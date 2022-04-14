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

    lazy var loadView: UIView = {
        let view = UIView()
        view.frame = collectionView.bounds
        view.backgroundColor = .systemGray6
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(
            x: view.bounds.midX,
            y: view.bounds.midY - 60,
                    width: 40,
                    height: 40
                )
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return indicator
    }()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        viewModel.createContactArray()
        viewModel.closure()

        if !viewModel.contactArray.isEmpty {
            hiddenLoadingView()
            print("viewDidAppear \(viewModel.contactArray.count)")
        }

//        viewModel.setQueueForCreateSequens {
//            self.hiddenLoadingView()
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addSubview(loadView)
        loadView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        registerCell()
        bind()
        print("viewDidLoad \(viewModel.contactArray.count)")
    }

    @IBAction func buttonPress(_ sender: Any) {
        print("Button Press \(viewModel.contactArray.count)")
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
        dataSource.objects = viewModel.cellData
    }

    func hiddenLoadingView() {
        loadView.isHidden = true
        activityIndicator.stopAnimating()

    }
}
