//
//  CustomTableViewCell.swift
//  Collections
//
//  Created by Иван Тарасенко on 10.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelInCell: UILabel!

    let dataCell = ExtractionNameForCell()

    func setNameCell(indexPath: IndexPath) {
        let name = dataCell.data[indexPath.row]
        labelInCell.textTitle = name.nameCell
    }

}
