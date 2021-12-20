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
    private var textTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        cteateTableView()
        createTextTitle()
    }

    func createTextTitle() {
        textTitle = UILabel()
        textTitle.text = "Collections"
        textTitle.font = UIFont.boldSystemFont(ofSize: 37)
        self.view.addSubview(textTitle)

        textTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
        }
    }

    func cteateTableView() {
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(130)
            make.leading.trailing.bottom.equalToSuperview().inset(0)
        }
    }
}
