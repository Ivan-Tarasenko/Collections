////
////  ArrayDataSiurce.swift
////  Collections
////
////  Created by Иван Тарасенко on 12.03.2022.
////
//
//import UIKit
//
//class ArrayDataSiurce: NSObject, UICollectionViewDataSource {
//
//    let arrayViewModel = ArrayViewModel()
////    var bigArray = arrayViewModel.getBigArray()
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return bigArray.isEmpty ? 1 : 2
//   }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//       return section == 0 ? 1 : arrayViewModel.dataArray.count
//   }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//       guard let cell = collectionView.dequeueReusableCell(
//           withReuseIdentifier: ArrayCollectionViewCell.identifier,
//           for: indexPath) as? ArrayCollectionViewCell else { fatalError() }
//
////        print("print index \(indexPath.row)")
////        print("value sections \(indexPath.section)")
//
////       let name = arrayViewModel.dataArray[indexPath.row]
//       cell.backgroundColor = .systemGray4
//       cell.layer.borderWidth = 0.5
//
//       if indexPath.section == 0 {
//           cell.label.textTitle = arrayViewModel.titleBigArray
//           cell.label.textAlignment = .center
//       } else {
//           cell.label.text = "\(indexPath.row)"
////           print("\(indexPath.section)")
//       }
//
//        if bigArray.isEmpty {
//           cell.label.textColor = .systemBlue
//       } else {
//           cell.label.textColor = .black
//           cell.backgroundColor = .white
//       }
//
//       return cell
//   }
//}
