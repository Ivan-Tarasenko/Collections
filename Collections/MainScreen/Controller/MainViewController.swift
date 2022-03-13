//
//  MainViewControllerTableViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    private let dataSource = MainDataSource()
    private let viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setTitleBackButton()
        setHeidhtCell()

    }

    func bind() {
        tableView.dataSource = dataSource
        dataSource.object = viewModel.cellData
    }

    func setTitleBackButton() {
        navigationItem.backButtonTitle = "Collections"
    }

    func setHeidhtCell() {
        tableView.rowHeight = 44
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "transitionArray":
            if let destantArray = segue.destination as? ArrayViewController {
                destantArray.navigationItem.title = "Array: \(viewModel.getRandomValue())"
            }
        case "transitionSet":
            if let destantSet = segue.destination as? SetViewController {
                destantSet.navigationItem.title = "Set: \(viewModel.getRandomValue())"
            }
        case "transitionDictionary":
            if let destantDictionary = segue.destination as? DictionaryViewController {
                destantDictionary.navigationItem.title = "Dictionary: \(viewModel.getRandomValue())"
            }
        default: break
        }
    }
}
