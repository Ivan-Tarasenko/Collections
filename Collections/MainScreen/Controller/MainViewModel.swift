//
//  MainViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 09.03.2022.
//

import Foundation

class MainViewModel {

    let titleTableView = NSLocalizedString("titleTableView", comment: "Title UITbleView")
    let nameFirstCell = NSLocalizedString("firstCell", comment: "title first cell")
    let nameSecondCell = NSLocalizedString("secondCell", comment: "title second cell")
    let nameThirdCell = NSLocalizedString("thirdCell", comment: "title third cell")

    var data = [TableViewData]()

    func fetchData() {
        data = [TableViewData(nameCell: nameFirstCell),
                TableViewData(nameCell: nameSecondCell),
                TableViewData(nameCell: nameThirdCell)
        ]
    }

    func getRandomValue() -> Int {
        return Int.random(in: 0...9999)
    }
}
