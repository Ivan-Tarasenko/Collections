//
//  SetVC.swift
//  Collections
//
//  Created by Иван Тарасенко on 23.12.2021.
//

import UIKit
import SnapKit

class SetVC: UIViewController {

  private var myView = CustomView()
    private var twoView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setNavigationBar()
        createCustomView()
        createTwoView()
    }

    func createCustomView() {
        myView.settingView(type: .noDigits)
        view.addSubview(myView)
        myView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 343, height: 66))
            make.leading.trailing.equalTo(view).inset(20)
            make.top.equalTo(view).inset(150)
        }
    }

    func createTwoView() {
        view.addSubview(twoView)
        twoView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 343, height: 66))
            make.leading.trailing.equalTo(view).inset(20)
            make.top.equalTo(myView).inset(100)
        }
    }

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
