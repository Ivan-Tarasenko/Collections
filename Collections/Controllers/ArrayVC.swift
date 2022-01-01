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
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 1 ? 1 : model.operationOptions.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let sizeBigArrayCell = CGSize(
            width: self.view.frame.size.width,
            height: self.view.frame.size.height / 7
        )
        let sizeCell = CGSize(width: (
            self.view.frame.size.width / 2) - 0.1,
                              height: (self.view.frame.size.height / 7)
        )

        return indexPath.row == 0 ? sizeBigArrayCell : sizeCell
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionViewCell.identifier,
            for: indexPath
        ) as? CustomCollectionViewCell else {fatalError()}

        cell.layer.borderWidth = 0.4
        cell.layer.borderColor = CGColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        cell.titleLabel.text = "\(model.operationOptions[indexPath.row])"

                if indexPath.row == 0 {
                    cell.titleLabel.textAlignment = .center
                } else {
//                    cell.isHidden = true
                }

        if currentSelected != nil && currentSelected == indexPath.row {
            cell.backgroundColor = .white
//            cell.titleLabel.text = model.timeOperation(string: "create Big Array", operation: {
//                model.bigArray = Array(0...9_999_999)
//            })
        } else {
            cell.backgroundColor = .systemGray5
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        guard let cell = collectionView.dequeueReusableCell(
        //            withReuseIdentifier: CustomCollectionViewCell.identifier,
        //            for: indexPath
        //        ) as? CustomCollectionViewCell else {fatalError()}

//        if previousSelected != nil {
//            if let cell = collectionView.cellForItem(at: previousSelected!) {
////                cell.isHidden = false
//            }
//        }
        currentSelected = indexPath.row
        previousSelected = indexPath

        // For reload the selected cell
        self.collectionView.reloadItems(at: [indexPath])
    }

    //        switch indexPath.row {
    //        case 0:
    //            print("press \(indexPath.row)")
    //        case 1:
    //            print("press \(indexPath.row)")
    //        case 2:
    //            print("press \(indexPath.row)")
    //        case 3:
    //            print("press \(indexPath.row)")
    //        case 4:
    //            print("press \(indexPath.row)")
    //        case 5:
    //            print("press \(indexPath.row)")
    //        case 6:
    //            print("press \(indexPath.row)")
    //        case 7:
    //            print("press \(indexPath.row)")
    //        case 8:
    //            print("press \(indexPath.row)")
    //        case 9:
    //            print("press \(indexPath.row)")
    //        case 10:
    //            print("press \(indexPath.row)")
    //        case 11:
    //            print("press \(indexPath.row)")
    //        case 12:
    //            print("press \(indexPath.row)")
    //        default:
    //            break
    //        }
    //        }

}
