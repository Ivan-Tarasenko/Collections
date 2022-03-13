//
//  MainViewControllerTableViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let mainViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel.fetchData()
        navigationItem.backButtonTitle = "Collections"
        tableView.rowHeight = 44

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "transitionArray":
            if let destantArray = segue.destination as? ArrayViewController {
                destantArray.navigationItem.title = "Array: \(mainViewModel.getRandomValue())"
            }
        case "transitionSet":
            if let destantSet = segue.destination as? SetViewController {
                destantSet.navigationItem.title = "Set: \(mainViewModel.getRandomValue())"
            }
        case "transitionDictionary":
            if let destantDictionary = segue.destination as? DictionaryViewController {
                destantDictionary.navigationItem.title = "Dictionary: \(mainViewModel.getRandomValue())"
            }
        default: break
        }
    }
}
// MARK: - Extention ViewController on TableViewDataSours and TableViewDelegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { fatalError() }

        let name = mainViewModel.data[indexPath.row]

        cell.setCell(data: name)
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.frame = CGRect(
            x: 20, y: 0,
            width: headerView.frame.width,
            height: headerView.frame.height-10
        )
        label.text = mainViewModel.titleTableView
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
