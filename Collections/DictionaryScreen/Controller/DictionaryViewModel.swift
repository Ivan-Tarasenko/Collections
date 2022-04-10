//
//  DictionaryViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 29.03.2022.
//

import Foundation

class DictionaryViewModel {
    var contactArray = [Contact]()
    var contactDictionary = [String: Int]()

   private let queueMain = DispatchQueue.main
   private let concurrentQueue = DispatchQueue(label: "QueueForStartCell", attributes: .concurrent)

    private(set) var cellData: [DictionaryCollectionModel] = []
    private var dataManager = DictionaryDataManager.dicShared

    init() {
        cellData = dataManager.fetchDictionaryData()
    }

    func doublesArray(sequence: inout[Any]) {
        for element in 0...4
            where element % 2 == 0 {
            sequence.insert(sequence[element], at: element + 1)
            }
    }

    // MARK: - Create sequens
    func createContactArray() {
        var array = [Contact]()
        for number in 0...9_999_999 {
           array.append(Contact(name: "name \(number)", numberPhone: "number phone \(number)"))
        }
        contactArray = array
    }

    func createContactDictionary() {
        var dictionaryContact: [String: Int] = [:]
        let arrayValue = Array(0...9_999_999)

        for (key, value) in arrayValue.enumerated() {
            dictionaryContact["name \(key)"] = arrayValue[value]
        }
        contactDictionary = dictionaryContact
    }

    // MARK: - Operations with array
    func findFirstValueArray() -> String {
        let array = contactArray
        return array.first?.name ?? "nill"
    }

    func findLastValueArray() -> String {
        let array = contactArray
        return array.last?.name ?? "nill"
    }

    func arraySearchNonExistentValue(string: String) -> Bool {
        let array = contactArray
        return (array.first(where: {$0.name == string}) != nil)
    }

    // MARK: - Operations with dictionary

    func findFirstValueDictionary() -> String {
        let dictionary = contactDictionary
        return dictionary.first?.key ?? "nill"
    }

    func findLastValueDictionary() -> String {
        let dictionary = contactDictionary
        let sortedDictionary = dictionary.keys.sorted()
        return sortedDictionary.last ?? "nill"
    }

    func dictionarysSearcNonExistentValue(string: String) -> Bool {
        let dictionary = contactDictionary
        return (dictionary.first(where: {$0.key == string}) != nil)
    }
    // MARK: - Worning with treads

    
}
