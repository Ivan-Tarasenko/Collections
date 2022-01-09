//
//  UITableView.swift
//  Collections
//
//  Created by Иван Тарасенко on 07.01.2022.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Setting cell.
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model.myArray.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
            cell.textLabel?.text = "\(model.myArray[indexPath.row])"
            return cell
        }

    // MARK: - Setting title.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

            let label = UILabel()
            label.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width, height: headerView.frame.height-10)
            label.text = model.title
            label.font = UIFont.boldSystemFont(ofSize: 37)

            headerView.addSubview(label)

            return headerView
        }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 55
        }

    // MARK: - Transition on other view.
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            var viewController = UIViewController()
            let randomValue = Array.generateRandom(size: 9999)
            let title = "\(model.myArray[indexPath.row]): \(randomValue.randomIndex())"
            switch indexPath.row {
            case 0:
                viewController = ArrayVC()
                viewController.navigationItem.title = title
            case 1:
                viewController = SetVC()
                viewController.navigationItem.title = title
            case 2:
                viewController = DictionaryVC()
                viewController.navigationItem.title = title
            default:
                break
            }
            self.navigationController?.pushViewController(viewController, animated: true)
            }
    
}
