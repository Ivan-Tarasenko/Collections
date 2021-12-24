//
//  Arrya+RandomIndex.swift
//  Collections
//
//  Created by Иван Тарасенко on 24.12.2021.
//

import Foundation

extension Array {
    func randomIndex() -> Element {
        let randomIndex = Int(arc4random()) % count
        return self[randomIndex]
    }
}
