//
//  MainDataSource.swift
//  Collections
//
//  Created by Иван Тарасенко on 13.03.2022.
//

import UIKit

class MainDataSource: NSObject, UITableViewDataSource {

    var object = [TableViewData]()
    let viewModel = MainViewModel()

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { fatalError() }

        let name = object[indexPath.row]

        cell.setCell(data: name)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
