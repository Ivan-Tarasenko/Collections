//
//  MainViewControllerTableViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    private let dataSource = MainDataSource()
    private let viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setTitleBackButton()
        setHeidhtCell()
    }

    func bind() {
        tableView.dataSource = dataSource
        dataSource.object = viewModel.cellData
    }

    func setTitleBackButton() {
        navigationItem.backButtonTitle = NSLocalizedString("backButtonTitle", comment: "title for back Button")
    }

    func setHeidhtCell() {
        tableView.rowHeight = 44
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "transitionArray":
            if let destantArray = segue.destination as? ArrayViewController {
                destantArray.navigationItem.title = "Array: \(viewModel.getRandomValue())"
            }
        case "transitionSet":
            if let destantSet = segue.destination as? SetViewController {
                destantSet.navigationItem.title = "Set: \(viewModel.getRandomValue())"
            }
        case "transitionDictionary":
            if let destantDictionary = segue.destination as? DictionaryViewController {
                destantDictionary.navigationItem.title = "Dictionary: \(viewModel.getRandomValue())"
            }
        default: break
        }
    }
}

// MARK: - UITableViewDelegate for MainViewController
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
