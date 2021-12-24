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
            cell.textLabel?.text = "\(myArray[0])"
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 37)
        case 1, 2, 3:
            cell.textLabel?.text = "\(myArray[indexPath.row])"
        default:
            break
        }

        return cell
    }
}
