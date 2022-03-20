//
//  CustomTableViewCell.swift
//  Collections
//
//  Created by Иван Тарасенко on 10.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelInCell: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    func setCell(data: TableViewData) {
        labelInCell.textTitle = data.nameCell
    }
}

private extension CustomTableViewCell {
    func configure() {
        accessoryType = .disclosureIndicator
    }
}
