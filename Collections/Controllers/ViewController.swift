//
//  ViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let myArray: NSArray = ["Array", "Set", "Dictionary"]
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        cteateTableView()
    }

    func cteateTableView() {
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(0)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        return cell
    }
}
