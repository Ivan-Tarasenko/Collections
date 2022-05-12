//
//  DictionaryViewModel.swift
//  Collections
//
//  Created by Иван Тарасенко on 29.03.2022.
//

import Foundation

class DictionaryViewModel {

    var onUpdateCellData: (([DictionaryCollectionModel]) -> Void)?

    var contactArray = [Contact]()
    var contactDictionary = [String: Int]()

    let queueMain = DispatchQueue.main
    let concurrentQueue = DispatchQueue(label: "QueueForStartCell", attributes: .concurrent)

    private(set) var cellData: [DictionaryCollectionModel] = [] {
        didSet {
            onUpdateCellData?(cellData)
        }
    }
    
    private var dataManager = DictionaryDataManager.dicShared

    func fetchData() {
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

        for number in 0...9_999_999 {
            array.append(Contact(name: "name \(number)", numberPhone: "number phone \(number)"))
            dictionary["name \(number)"] = number
        }
        queueMain.async {
            self.contactArray = array
            self.contactDictionary = dictionary
            completion()
        }
    }

    // MARK: - Operations with array
    func findFirstValueArray() -> String {
        let array = contactArray
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
        var answer = String()
        let title = NSLocalizedString("findLastAnswer", comment: "")
        let result = NSLocalizedString("result", comment: "")

        let insetTitle = taskCompletionTime(string: title) {
            answer = array.last?.name ?? "nill"
        }
        return "\(insetTitle) \(result)\(answer)"
    }

    func arraySearchNonExistentValue() -> String {
        let array = contactArray
        var answer = Bool()
        let nonExistentElement = "10_000_000"
        let title = NSLocalizedString("searchForNonExistingAnswer", comment: "")
        let result = NSLocalizedString("result", comment: "")

        let insetTitle = taskCompletionTime(string: title) {
            answer = array.first(where: {$0.name == nonExistentElement}) != nil
        }
        return "\(insetTitle) \(result)\(answer)"
    }

    // MARK: - Operations with dictionary
    func findFirstValueDictionary() -> String {
        let dictionary = contactDictionary
        var answer = String()
        let title = NSLocalizedString("findFirstAnswer", comment: "")
        let result = NSLocalizedString("result", comment: "")

        let insetTitle = taskCompletionTime(string: title) {
            answer = dictionary.first?.key ?? "nill"
        }
        return "\(insetTitle) \(result)\(answer)"

    }

    func findLastValueDictionary() -> String {
        let dictionary = contactDictionary
        var answer = String()
        let title = NSLocalizedString("findFirstAnswer", comment: "")
        let result = NSLocalizedString("result", comment: "")

        let insetTitle = taskCompletionTime(string: title) {
            let sortedDictionary = dictionary.keys.sorted()
            answer = sortedDictionary.last ?? "nill"
        }
        return "\(insetTitle) \(result)\(answer)"
    }

    func dictionarysSearcNonExistentValue() -> String {
        let dictionary = contactDictionary
        var answer = Bool()
        let nonExistentElement = "10_000_000"
        let title = NSLocalizedString("searchForNonExistingAnswer", comment: "")
        let result = NSLocalizedString("result", comment: "")

        let insetTitle = taskCompletionTime(string: title) {
            answer = dictionary.first(where: {$0.key == nonExistentElement}) != nil
        }
        return "\(insetTitle) \(result)\(answer)"
    }

    // MARK: - Worning with treads

    func setQueueForOperations(indexPath: IndexPath, completion: @escaping () -> Void) {
        guard !contactArray.isEmpty, !contactDictionary.isEmpty else { return }

        cellData[indexPath.row].isPerfoming = true

        var timeOperation = String()
        concurrentQueue.async { [weak self] in
            guard let self = self else { return }
            switch indexPath.row {
            case 0:
                timeOperation = self.findFirstValueArray()
            case 1:
                timeOperation = self.findFirstValueDictionary()
            case 2:
                timeOperation = self.findLastValueArray()
            case 3:
                timeOperation = self.findLastValueDictionary()
            case 4:
                timeOperation = self.arraySearchNonExistentValue()
            case 5:
                timeOperation = self.dictionarysSearcNonExistentValue()
            default:
                break
            }
            self.queueMain.sync {
                self.cellData[indexPath.row].title = timeOperation
                completion()
            }
        }
    }
}
