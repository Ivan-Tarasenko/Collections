//
//  ArrayViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 13.03.2022.
//

import Foundation
import UIKit

class ArrayViewModel {

    let queueMain = DispatchQueue.main
    let concurrentQueue = DispatchQueue(label: "CreateBigArrayQueue", attributes: .concurrent)
    
    private(set) var cellData: [ArrayCollectionModel] = []
    private var dataManager = ArrayDataManager.shared

    init() {
        cellData = dataManager.fetchArrayData()
    }

    // Method for determining the algorithm execution speed.
    func taskCompletionTime (string: String, execute: () -> Void ) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        execute()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        let timeElapsedDouble = Double(timeElapsed)
        let answer = (round(1000 * timeElapsedDouble) / 1000)
        return "\(string): \(answer) ms."
    }

    func createsQueueStartCell(cell: ArrayCollectionViewCell) {
        concurrentQueue.sync {
            cell.cellStart()
        }
    }

    func createQueueFinishCell(cell: ArrayCollectionViewCell, title: String) {
        queueMain.sync {
            cell.cellFinish(title: title)
        }
    }
}
