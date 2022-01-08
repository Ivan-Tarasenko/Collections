//
//  MainViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 17.12.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    let model = Model()
    private var titleLabet: UILabel!
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        cteateTableView()

    }

    func createTitle() {
        titleLabet = UILabel()
        titleLabet.font = UIFont.boldSystemFont(ofSize: 37)
        titleLabet.text = model.title
        tableView.addSubview(titleLabet)

//        titleLabet.snp.makeConstraints { make in
//            make.top.equalTo
//        }
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

    func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.backButtonTitle = model.title
    }
}
