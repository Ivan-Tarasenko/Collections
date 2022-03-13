//
//  MainDataManager.swift
//  Collections
//
//  Created by Иван Тарасенко on 13.03.2022.
//

import Foundation

class MainDataManager {

    // Singleton
    static var shared = MainDataManager()

   private init() {}

    let nameFirstCell = NSLocalizedString("firstCell", comment: "title first cell")
    let nameSecondCell = NSLocalizedString("secondCell", comment: "title second cell")
    let nameThirdCell = NSLocalizedString("thirdCell", comment: "title third cell")

    func fetchData() -> [TableViewData] {
        var data = [TableViewData]()
        data.append(TableViewData(nameCell: nameFirstCell))
        data.append(TableViewData(nameCell: nameSecondCell))
        data.append(TableViewData(nameCell: nameThirdCell))
        return data
    }

}
