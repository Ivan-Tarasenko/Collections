//
//  MainViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 09.03.2022.
//

import Foundation

class MainViewModel {
    
    private(set) var cellData: [TableViewData] = []
    private var dataManager = MainDataManager.shared

    init() {
        cellData = dataManager.fetchData()
    }

    func getRandomValue() -> Int {
        return Int.random(in: 0...9999)
    }
}
