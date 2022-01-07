//
//  UITableView.swift
//  Collections
//
//  Created by Иван Тарасенко on 07.01.2022.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setting cell
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model.myArray.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
            if indexPath.row == 0 {
                cell.textLabel?.text = "\(model.myArray[indexPath.row])"
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 37)
                cell.selectionStyle = .none
            } else {
                cell.textLabel?.text = "\(model.myArray[indexPath.row])"
                cell.accessoryType = .disclosureIndicator
            }
            return cell
        }
    // MARK: - Transition on other view.
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            var viewController = UIViewController()
            let randomValue = Array.generateRandom(size: 9999)
            let title = "\(model.myArray[indexPath.row]): \(randomValue.randomIndex())"
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
