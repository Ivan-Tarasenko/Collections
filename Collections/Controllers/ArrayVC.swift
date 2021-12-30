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
        layout.minimumLineSpacing = 0.1
        layout.minimumInteritemSpacing = 0.1
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
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 1 ? 1 : model.operationOptions.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize()
        switch indexPath.row {
        case 0:
            size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height / 7)
        case 1, 2, 3, 4, 5, 6, 7, 8, 9:
            size = CGSize(width: (self.view.frame.size.width / 2) - 0.1, height: (self.view.frame.size.height / 7))
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
        cell.layer.borderWidth = 0.4
        cell.layer.borderColor = CGColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        if indexPath.row == 0 {
            cell.titleLabel.textAlignment = .center
        }
        return cell
    }

}























import SwiftUI

struct ArrayVC_Provider : PreviewProvider {

    static var previews: some View {
        Group {
            ContainterView().edgesIgnoringSafeArea(.all)
        }
    }

    struct ContainterView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            return ArrayVC()
        }

        typealias UIViewControllerType = UIViewController

        let viewController = ArrayVC()
        func makeUIViewController(context: UIViewControllerRepresentableContext<ArrayVC_Provider.ContainterView>)
        -> ArrayVC {
            return viewController
        }

        func updateUIViewController(_ uiViewController: ArrayVC_Provider.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<ArrayVC_Provider.ContainterView>) {

        }

    }

}

