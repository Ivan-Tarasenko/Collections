//
//  SetVC.swift
//  Collections
//
//  Created by Иван Тарасенко on 23.12.2021.
//

import UIKit
import SnapKit

class SetVC: UIViewController {

    @IBOutlet weak var customView: CustomTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setNavigationBar()
        let myView = CustomTextField(frame: CGRect(x: 20, y: 100, width: 343, height: 66))
        self.view.addSubview(myView)
        
//        createCustomView()
    }

//    func createCustomView() {
//        customView = CustomTextField()
////        customView.backgroundColor = .red
//        view.addSubview(customView)
//        customView.snp.makeConstraints { make in
//            make.size.equalTo(CGSize(width: 343, height: 66))
//            make.center.equalTo(view)
//        }
//    }

    func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .white
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
