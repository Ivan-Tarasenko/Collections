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

    func fetchData() -> [TableViewData] {
        var data = [TableViewData]()
        data.append(TableViewData(
            nameCell: NSLocalizedString("firstCell", comment: "title first cell")))
        data.append(TableViewData(
            nameCell: NSLocalizedString("secondCell", comment: "title second cell")))
        data.append(TableViewData(
            nameCell: NSLocalizedString("thirdCell", comment: "title third cell")))
        return data
    }

}
