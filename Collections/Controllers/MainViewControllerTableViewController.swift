//
//  MainViewControllerTableViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class MainViewController: UITableViewController {

    let titleTableView = NSLocalizedString("titleTableView", comment: "Title UITbleView")
    let nameFirstCell = NSLocalizedString("firstCell", comment: "title first cell")
    let nameSecondCell = NSLocalizedString("secondCell", comment: "title second cell")
    let nameThirdCell = NSLocalizedString("thirdCell", comment: "title third cell")

    var nameCell = [TableViewText]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameCell = [TableViewText(nameCell: nameFirstCell),
                    TableViewText(nameCell: nameSecondCell),
                    TableViewText(nameCell: nameThirdCell)
        ]

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return nameCell.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let name = nameCell[indexPath.row]
        cell.textLabel?.text = name.nameCell
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    // MARK: - Setting title.
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        let label = UILabel()
        label.frame = CGRect(x: 20, y: 0, width: headerView.frame.width, height: headerView.frame.height-10)
        label.text = titleTableView
        label.font = UIFont.boldSystemFont(ofSize: 37)

        headerView.addSubview(label)

        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController = UIViewController()
        let randomValue = Int.random(in: 0...9999)
        let name = nameCell[indexPath.row]
        let title = "\(name.nameCell): \(randomValue)"
        switch indexPath.row {
        case 0:
            viewController = ArrayViewController()
            viewController.navigationItem.title = title
        case 1:
            viewController = SetViewController()
            viewController.navigationItem.title = title
        case 2:
            viewController = DictionaryViewController()
            viewController.navigationItem.title = title
        default:
            break
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
