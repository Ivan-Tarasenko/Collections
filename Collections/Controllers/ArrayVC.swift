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


// Setting queue
    let queueMain = DispatchQueue.main
    let queueBigArray = DispatchQueue(label: "CreateBigArrayQueue", attributes: .concurrent)

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
//        return model.bigArray.isEmpty ? 1 : 2
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.operationOptions.count
//        return section == 0 ? 1 : model.operationOptions.count
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
            for: indexPath) as? CustomCollectionViewCell else {fatalError()}

        cell.backgroundColor = .systemGray4
        cell.layer.borderWidth = 0.4
        cell.layer.borderColor = CGColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        cell.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        if indexPath.row == 0 {
            cell.titleLabel.textAlignment = .center
            cell.titleLabel.text = model.titleBigArray
        } else {
            cell.titleLabel.text = "\(model.operationOptions[indexPath.row])"
        }

        return cell
    }

    @objc func buttonAction(sender: UIButton!) {
//
        let convertedPoint: CGPoint = sender.convert(CGPoint.zero, to: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: convertedPoint)
        guard let cell = self.collectionView.cellForItem(at: indexPath!) as? CustomCollectionViewCell else {fatalError()}

//////////////////////////////////////////
        if model.bigArray.isEmpty {
        queueBigArray.sync {
            cell.titleLabel.textTitle.removeAll()
            cell.activityIndicator.startAnimating()
            print(model.bigArray.count)
        }

        queueBigArray.async { [self] in
           let timeOperation =  model.timeOperation(string: "create Big Array", operation: {
                            model.bigArray = Array(0...9_999_999)
                        })
            queueMain.sync {
                collectionView.reloadData()
            }

            queueMain.sync {
                cell.activityIndicator.stopAnimating()
                cell.activityIndicator.isHidden = true
                cell.titleLabel.textTitle = timeOperation
                cell.titleLabel.textColor = .black
                cell.backgroundColor = .white
                print(model.bigArray.count)

            }
        }
        } else {
            cell.titleLabel.textTitle = "хватит блять обнавлять интерфейс"
        }
/////////////////////////////////////////
//        if model.bigArray.isEmpty {
//        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
//            timeOperation =  model.timeOperation(string: "create Big Array", operation: {
//                model.bigArray = Array(0...9_999_999)
//            })
//
//            DispatchQueue.main.async {
//                collectionView.reloadData()
//            }
//        }
//        }
//
//        if model.bigArray.isEmpty {
//            cell.titleLabel.textTitle.removeAll()
//            cell.activityIndicator.hidesWhenStopped = true
//            cell.activityIndicator.startAnimating()
//        } else {
//            cell.titleLabel.textTitle = "array not is empty"
//        }

//        let indexSet = IndexSet(integer: indexPath!.section)
//         collectionView.reloadSections(indexSet)

//        cell.titleLabel.textTitle = timeOperation

//        print("click button \(indexPath!.row) sectoin \(indexPath!.section)")

        //        if !model.bigArray.isEmpty {
        //            collectionView.reloadData()
        //    }

        //        if indexPath?.section == 1 {
        //            switch indexPath?.row {
        //            case 0:
        //                cell.backgroundColor = .green
        //            case 1:
        //                cell.backgroundColor = .blue
        //            case 2:
        //                cell.backgroundColor = .red
        //            case 3:
        //                cell.backgroundColor = .black
        //            case 4:
        //                cell.backgroundColor = .brown
        //            case 5:
        //                cell.backgroundColor = .systemPink
        //            case 6:
        //                cell.backgroundColor = .systemGray
        //            case 7:
        //                cell.backgroundColor = .darkGray
        //            case 8:
        //                cell.backgroundColor = .yellow
        //            case 9:
        //                cell.backgroundColor = .orange
        //            case 10:
        //                cell.backgroundColor = .purple
        //            case 11:
        //                cell.backgroundColor = .systemBlue
        //            case 12:
        //                cell.backgroundColor = .systemGray4
        //            default:
        //                break
        //
        //            }
        //        }

    }
//////////////////////////////////////////////




//        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//                    guard let cell = cell as? CustomCollectionViewCell else {return}
//
//            queueGlobal.sync {
//                cell.activityIndicator.startAnimating()
//                cell.titleLabel.textTitle.removeAll()
//            }
//            queueGlobal.async { [self] in
//                let title = model.timeOperation(string: "Create Big Array") {
//                    model.bigArray = Array(0...9_999_999)
//                }
//                queueMain.sync {
//                    cell.titleLabel.textTitle = title
//                    cell.titleLabel.textColor = .black
//                    cell.activityIndicator.stopAnimating()
//                    cell.activityIndicator.hidesWhenStopped = true
//                }
//            }
//
//            if indexPath.section == 0 {
//
//            }
//
//                    switch indexPath.section {
//                    case 1:
//                        cell.backgroundColor = .red
//                    default:
//                        cell.backgroundColor = .blue
//                    }
//                }
//

//
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//                    guard let cell = collectionView.dequeueReusableCell(
//                        withReuseIdentifier: CustomCollectionViewCell.identifier,
//                        for: indexPath
//                    ) as? CustomCollectionViewCell else {fatalError()}
//
//
//            if indexPath.row == 2 {
//                cell.backgroundColor = .red
//            }

           
//            queueGlobal.sync {
//                cell.activityIndicator.startAnimating()
//                cell.titleLabel.textTitle.removeAll()
//            }
//            queueGlobal.async { [self] in
//                let title = model.timeOperation(string: "Create Big Array") {
//                    model.bigArray = Array(0...9_999_999)
//                }
//                queueMain.sync {
////                    collectionView.reloadData()
//                }
//                queueMain.sync {
//                    cell.titleLabel.textTitle = title
//                    cell.titleLabel.textColor = .black
//                    cell.activityIndicator.stopAnimating()
//                    cell.activityIndicator.hidesWhenStopped = true
//                }
//            }
//            guard (self.collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell) != nil else {fatalError()}

//    print("click to cell")
//            if indexPath.row == 0 {
//                cell.backgroundColor = .systemOrange
//            }
//            currentSelected = indexPath.row
//            previousSelected = indexPath
//
//            // For reload the selected cell
//            self.collectionView.reloadItems(at: [indexPath])
//        }

}
