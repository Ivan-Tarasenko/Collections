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
    func createCollections(completion: @escaping () -> Void) {
        var array = [Contact]()
        var dictionary = [String: Int]()

        for number in 0...9_999_99 {
            array.append(Contact(name: "name \(number)", numberPhone: "number phone \(number)"))
            dictionary["name \(number)"] = number
        }
        queueMain.async {
            self.contactArray = array
            self.contactDictionary = dictionary
            completion()
        }
    }

    func test() {
        if !contactArray.isEmpty {
            print("test \(contactArray.count)")
        }
        print("finish test \(contactArray.count)")
    }
    // MARK: - Operations with array

//    func perfomOperation(indexPath: IndexPath, completion: @escaping () -> Void) {
//        switch indexPath.row {
//        case 0:
//            findFirstValueArray()
//        case 1:
//            findFirstValueDictionary()
//        case 2:
//            findLastValueArray()
//        case 3:
//            findLastValueDictionary()
//        case 4:
//            arraySearchNonExistentValue(string: <#T##String#>)
//        case 5:
//        default:
//            break
//        }

//    }

    func findFirstValueArray() -> String {
        let array = contactArray
        print( "Methot \(contactArray.count)")
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
