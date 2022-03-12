//
//  CustomTableViewCell.swift
//  Collections
//
//  Created by Иван Тарасенко on 10.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelInCell: UILabel!

    func setCell(data: TableViewData) {
        labelInCell.textTitle = data.nameCell
    }
}
