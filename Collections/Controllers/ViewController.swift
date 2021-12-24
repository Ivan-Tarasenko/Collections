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
    private var myArray: NSArray = ["Collections", "Array", "Set", "Dictionary"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.title = "Collectctions"
        cteateTableView()

    }

    func cteateTableView() {
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(0)
            make.leading.trailing.bottom.equalToSuperview().inset(0)
        }
    }
// MARK: - Setting sell
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            let arrayVC = ArrayVC()
            let randomValue = Array.generateRandom(size: 999)
            arrayVC.navigationItem.title = "\(myArray[indexPath.row]): \(randomValue.randomIndex())"
             self.navigationController?.pushViewController(arrayVC, animated: true)
        case 2:
            let setVC = SetVC()
            setVC.navigationItem.title = "\(myArray[indexPath.row])"
            self.navigationController?.pushViewController(setVC, animated: true)
        case 3:
            let dictionaryVC = DictionaryVC()
            dictionaryVC.navigationItem.title = "\(myArray[indexPath.row])"
            self.navigationController?.pushViewController(dictionaryVC, animated: true)
        default:
            break
        }

        }
}
