//
//  Queue.swift
//  Collections
//
//  Created by Иван Тарасенко on 15.03.2022.
//

import Foundation
import UIKit

class WorkingCell {

    private let bigArrayModel = BigArrayModel()
    private let arrayModel = ArrayModel()

    func gettingStartedTheCell(cell: ArrayCollectionViewCell) {
        cell.label.text!.removeAll()
        cell.activityIndicator.startAnimating()
    }

    func endOfWorkingTheCell(cell: ArrayCollectionViewCell, titleCell: String) {
        cell.activityIndicator.stopAnimating()
        cell.activityIndicator.isHidden = true
        cell.label.text = titleCell
        cell.label.textColor = .black
        cell.backgroundColor = .white
    }
}
