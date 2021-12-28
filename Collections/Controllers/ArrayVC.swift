//
//  ArrayVC.swift
//  Collections
//
//  Created by Иван Тарасенко on 23.12.2021.
//

import UIKit
import SnapKit

class ArrayVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let model = ArrayCreate()

    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setCollectionView()
    }

    func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .white
    }

    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
//        layout.itemSize = CGSize(width: (self.view.frame.size.width / 3) - 4, height: (self.view.frame.size.height / 3) - 4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(
            CustomCollectionViewCell.self,
            forCellWithReuseIdentifier: CustomCollectionViewCell.identifier
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds

    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
        }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 1 ? 1 : model.operationOptions.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()
        switch indexPath.row {
        case 1:
        size = CGSize(width: self.view.frame.size.width, height: (self.view.frame.size.height / 3) - 4)
        case 2:
            size = CGSize(width: 100, height: 100)
//            size = CGSize(width: (self.view.frame.size.width / 3) - 4, height: (self.view.frame.size.height / 3) - 4)
        default:
            break
        }
        return size
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionViewCell.identifier,
            for: indexPath
        ) as? CustomCollectionViewCell else {fatalError()}
        cell.titleLabel.text = "\(model.operationOptions[indexPath.row])"
        cell.layer.borderWidth = 1

        if numberOfSections(in: collectionView) == 1 {
            cell.contentView.backgroundColor = .systemBlue

        }
        return cell
    }

}
