//
//  Array+generateRandom.swift
//  Collections
//
//  Created by Иван Тарасенко on 22.12.2021.
//

import Foundation

public extension Array where Element == Int {
    static func generateRandom(size: Int) -> [Int] {
        guard size > 0 else {
            return [Int]()
        }
        return Array(0..<size).shuffled()
    }
}
