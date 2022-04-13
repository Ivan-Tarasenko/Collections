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

    let queueMain = DispatchQueue.main
    let concurrentQueue = DispatchQueue(label: "QueueForStartCell", attributes: .concurrent)

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

    // Method for determining the algorithm execution speed.
    func taskCompletionTime (string: String, execute: () -> Void ) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        execute()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        let timeElapsedDouble = Double(timeElapsed)
        let answer = (round(1000 * timeElapsedDouble) / 1000)
        return "\(string): \(answer) ms."
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
        print(contactArray.count)
        var answer = String()
        let title = NSLocalizedString("findFirstAnswer", comment: "")
        let result = NSLocalizedString("result", comment: "")

        let insetTitle = taskCompletionTime(string: title) {
            answer = array.first?.name ?? "nill"
        }
        return "\(insetTitle) \(result)\(answer)"
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

    func setQueueForStartCell(cell: DictionaryCollectionViewCell) {
        concurrentQueue.sync {
            cell.workStart()
        }
    }

    func setQueueFinishCell(cell: DictionaryCollectionViewCell, titleCell: String) {
        queueMain.sync {
            cell.workFinish(title: titleCell)
        }
    }

    func setQueueForCreateSequens(update: @escaping() -> Void) {
        concurrentQueue.async { [weak self] in
            guard let self = self else { return }
            self.createContactArray()
        }
        concurrentQueue.async { [weak self] in
            guard let self = self else { return }
            self.createContactDictionary()
            self.queueMain.sync {
                update()
            }
        }
    }

    func setQueueForOperations(indexPath: IndexPath, cell: DictionaryCollectionViewCell) {
        guard contactArray.isEmpty, contactDictionary.isEmpty else { return }

        var timeOperation = String()

        setQueueForStartCell(cell: cell)

        concurrentQueue.async { [weak self] in
            guard let self = self else { return }
            switch indexPath.row {
            case 0:
                timeOperation = self.findFirstValueArray()
            case 1:
                timeOperation = ""
            case 2:
                timeOperation = ""
            case 3:
                timeOperation = ""
            case 4:
                timeOperation = ""
            case 5:
                timeOperation = ""
            default:
                break
            }
            self.setQueueFinishCell(cell: cell, titleCell: timeOperation)
        }
    }
}
