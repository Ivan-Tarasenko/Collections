//
//  ViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

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
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(0)
        }
    }
}
