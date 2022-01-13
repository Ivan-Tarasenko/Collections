//
//  ArrayVC.swift
//  Collections
//
//  Created by Иван Тарасенко on 23.12.2021.
//

import UIKit
import SnapKit

class ArrayVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let model = Model()
    //    let cell = CustomCollectionViewCell()

    var previousSelected : IndexPath?
    var currentSelected : Int?


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
        return model.bigArray.isEmpty ? 1 : 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return model.operationOptions.count
        }
//        return model.bigArray.isEmpty ? 1 : model.operationOptions.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let sizeBigArrayCell = CGSize(
            width: self.view.frame.size.width,
            height: self.view.frame.size.height / 7
        )
        let sizeCell = CGSize(
            width: (self.view.frame.size.width / 2) - 0.1,
            height: (self.view.frame.size.height / 7)
        )

        return indexPath.section == 0 && indexPath.row == 0 ? sizeBigArrayCell : sizeCell
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionViewCell.identifier,
            for: indexPath
        ) as? CustomCollectionViewCell else {fatalError()}

        cell.layer.borderWidth = 0.4
        cell.layer.borderColor = CGColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
//        cell.titleLabel.text = "\(model.operationOptions[indexPath.row])"
        cell.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        if indexPath.section == 0 {
            cell.titleLabel.textAlignment = .center
            cell.titleLabel.text = model.titleBigArray
        } else {
            cell.titleLabel.text = "\(model.operationOptions[indexPath.row])"
        }
//        if indexPath.row == 4 {
//            cell.backgroundColor = .blue
//        } else if indexPath.row == 7 {
//            cell.backgroundColor = .red
//        }

        return cell
    }

    @objc func buttonAction(sender: UIButton!) {

        let convertedPoint: CGPoint = sender.convert(CGPoint.zero, to: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: convertedPoint)
        guard let cell = self.collectionView.cellForItem(at: indexPath!) as? CustomCollectionViewCell else {fatalError()}

        if indexPath?.section == 0 {
//            cell.backgroundColor = .white
//            cell.activityIndicator.hidesWhenStopped = true
//            cell.activityIndicator.startAnimating()
            cell.titleLabel.text = model.timeOperation(string: "create Big Array", operation: {
                            model.bigArray = Array(0...9_999)
            })
        }
        print("click button \(indexPath!.row) sectoin \(indexPath!.section)")

        if !model.bigArray.isEmpty {
//            let indexSet = IndexSet(integer: indexPath!.section)
//             collectionView.reloadSections(indexSet)


    }
    }

//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//                guard let cell = cell as? CustomCollectionViewCell else {return}
//
//                switch indexPath.section {
//                case 1:
//                    cell.backgroundColor = .red
//                default:
//                    cell.backgroundColor = .blue
//                }
//            }

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//                guard let cell = collectionView.dequeueReusableCell(
//                    withReuseIdentifier: CustomCollectionViewCell.identifier,
//                    for: indexPath
//                ) as? CustomCollectionViewCell else {fatalError()}
////        guard (self.collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell) != nil else {fatalError()}
//
//print("click to cell")
//        currentSelected = indexPath.row
//        previousSelected = indexPath
//
//        // For reload the selected cell
//        self.collectionView.reloadItems(at: [indexPath])
//    }

}
