//
//  TableView.swift
//  Collections
//
//  Created by Иван Тарасенко on 20.12.2021.
//

import Foundation
import UIKit

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
    
}
