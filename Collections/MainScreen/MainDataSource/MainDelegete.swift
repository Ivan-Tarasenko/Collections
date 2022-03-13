//
//  MainDelegete.swift
//  Collections
//
//  Created by Иван Тарасенко on 13.03.2022.
//

import UIKit

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleTableView = NSLocalizedString("titleTableView", comment: "Title UITebleView")
        let headerView = UIView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.frame = CGRect(
            x: 20, y: 0,
            width: headerView.frame.width,
            height: headerView.frame.height-10
        )
        label.text = titleTableView
        label.font = UIFont.boldSystemFont(ofSize: 37)
        headerView.addSubview(label)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "transitionArray", sender: self)
        case 1:
            performSegue(withIdentifier: "transitionSet", sender: self)
        case 2:
            performSegue(withIdentifier: "transitionDictionary", sender: self)
        default:
            break
        }
    }
}
