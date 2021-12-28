//
//  ViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView: UITableView!
    private var myArray = ["Collections", "Array", "Set", "Dictionary"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.backButtonTitle = "Collections"
        cteateTableView()

    }

    func cteateTableView() {
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(0)
        }
    }
// MARK: - Setting cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "\(myArray[indexPath.row])"
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 37)
            cell.selectionStyle = .none
        case 1, 2, 3:
            cell.textLabel?.text = "\(myArray[indexPath.row])"
            cell.accessoryType = .disclosureIndicator
        default:
            break
        }

        return cell
    }
// MARK: - Transition on other view.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController = UIViewController()
        let randomValue = Array.generateRandom(size: 9999)
        let title = "\(myArray[indexPath.row]): \(randomValue.randomIndex())"
        switch indexPath.row {
        case 1:
            viewController = ArrayVC()
            viewController.navigationItem.title = title
        case 2:
            viewController = SetVC()
            viewController.navigationItem.title = title
        case 3:
            viewController = DictionaryVC()
            viewController.navigationItem.title = title
        default:
            break
        }
        self.navigationController?.pushViewController(viewController, animated: true)
        }
}
