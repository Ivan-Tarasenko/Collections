//
//  MainVC+DataSours.swift
//  Collections
//
//  Created by Иван Тарасенко on 09.03.2022.
//

import UIKit

extension MainViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getNameCell.nameCell.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let name = getNameCell.nameCell[indexPath.row]
        cell.textLabel?.text = name.nameCell
        cell.accessoryType = .disclosureIndicator
        return cell
    }

}
