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

//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.operationOptions.count//section == 1 ? 1 : model.operationOptions.count
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
        cell.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

//        switch indexPath.row {
//        case 0:
//            cell.titleLabel.textAlignment = .center
//            cell.backgroundColor = .black
//        case 1, 2, 3, 4, 5, 6, 7:
//            cell.isHidden = true
//        default:
//            break
//        }

//                if indexPath.row == 0 {
//
//                    cell.titleLabel.textAlignment = .center
//                }
//
//        if indexPath.row != 0 {
//            cell.isHidden = true
//        }

        if currentSelected != nil && currentSelected == indexPath.row {
//            if indexPath.row == 0 {
//                cell.backgroundColor = .white
//                cell.isHidden = false
//            } else {
//            }
//            cell.isHidden = false
//            cell.backgroundColor = .white
//            cell.titleLabel.text = model.timeOperation(string: "create Big Array", operation: {
//                model.bigArray = Array(0...9_999_999)
//            })
        } else {
//            cell.backgroundColor = .systemGray5

        }

        return cell
    }

    @objc func buttonAction(sender: UIButton!) {

        let convertedPoint: CGPoint = sender.convert(CGPoint.zero, to: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: convertedPoint)
        guard let cell = self.collectionView.cellForItem(at: indexPath!) as? CustomCollectionViewCell else {fatalError()}


//        if indexPath?.row != 0 {
//            cell.isHidden = false
//            cell.backgroundColor = .blue
//        }
//        switch indexPath?.row {
//        case 0:
////            cell.titleLabel.textAlignment = .center
//            cell.backgroundColor = .white
//        case 1, 2, 3, 4, 5, 6, 7:
//            cell.isHidden = false
//        default:
//            break
//        }


        if indexPath?.row == 0 {
//            cell.backgroundColor = .white
//            cell.activityIndicator.hidesWhenStopped = true
//            cell.activityIndicator.startAnimating()
            cell.titleLabel.text = model.timeOperation(string: "create Big Array", operation: {
                            model.bigArray = Array(0...9_999_999)
            })

        }
        print("click button \(indexPath?.row)")

           if sender.isHighlighted {
               sender.isHighlighted = false
               // To change the UIView border color
               cell.backgroundColor = .blue
//               cell.activityIndicator.stopAnimating()
           } else {
              sender.isHighlighted = true
              // To change the UIView border color
//               cell.titleLabel.isHidden = true
//               cell.activityIndicator.hidesWhenStopped = true
//               cell.activityIndicator.startAnimating()
               cell.backgroundColor = .red
           }

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: CustomCollectionViewCell.identifier,
                    for: indexPath
                ) as? CustomCollectionViewCell else {fatalError()}

        if previousSelected != nil {
            if let cell = collectionView.cellForItem(at: previousSelected!) {
                cell.isHidden = false
            }
        }
        currentSelected = indexPath.row
        previousSelected = indexPath

        // For reload the selected cell
        self.collectionView.reloadItems(at: [indexPath])
    }

}
