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

        viewModel.createContactArray()

        if !viewModel.contactArray.isEmpty {
            hiddenLoadingView()
            reloadView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addSubview(loadView)
        loadView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
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
        dataSource.objects = viewModel.cellData
    }

    func hiddenLoadingView() {
        loadView.isHidden = true
        activityIndicator.stopAnimating()

    }

    private func reloadView() {
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "vc1") as? DictionaryViewController
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = vc1
    }
}
