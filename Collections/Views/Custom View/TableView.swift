//
//  TableView.swift
//  Collections
//
//  Created by Иван Тарасенко on 20.12.2021.
//

import UIKit
import SnapKit

//class CreateTableView: UITableView {
//
//    private var tableView: UITableView!
//    private var myArray: NSArray = ["Collections", "Array", "Set", "Dictionary"]
//
//    func cteateTableView() {
//        tableView = UITableView()
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
//        superview?.addSubview(tableView)
//
//        tableView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(10)
//            make.leading.trailing.bottom.equalTo(self)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
//        switch indexPath.row {
//        case 0:
//            cell.textLabel!.text = "\(myArray[0])"
//            cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 37)
//        case 1, 2, 3:
//            cell.textLabel!.text = "\(myArray[indexPath.row])"
//        default:
//            break
//        }
//
//        return cell
//    }
//}

private var myArray: NSArray = ["Collections", "Array", "Set", "Dictionary"]

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel!.text = "\(myArray[0])"
            cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 37)
        case 1, 2, 3:
            cell.textLabel!.text = "\(myArray[indexPath.row])"
        default:
            break
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "YourSegueName", sender: self)
    }
    
}
