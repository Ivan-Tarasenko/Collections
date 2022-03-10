//
//  MainViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 09.03.2022.
//

import Foundation

class ExtractionNameForCell {

    let titleTableView = NSLocalizedString("titleTableView", comment: "Title UITbleView")
    let nameFirstCell = NSLocalizedString("firstCell", comment: "title first cell")
    let nameSecondCell = NSLocalizedString("secondCell", comment: "title second cell")
    let nameThirdCell = NSLocalizedString("thirdCell", comment: "title third cell")

    var data = [TableViewName]()

    func dataCell() {
        data = [TableViewName(nameCell: nameFirstCell),
                TableViewName(nameCell: nameSecondCell),
                TableViewName(nameCell: nameThirdCell)
        ]
    }
}
