//
//  Model.swift
//  Collections
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import Foundation

class Array {

    func array( number: Int) -> [Int] {
    let arr = (0...number).map( {_ in Int.random(in: 1...1000)} )
        return arr
    }
}
