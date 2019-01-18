//
//  SideMenueViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/16/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class SideMenueViewController: UIViewController {
@IBOutlet weak var tableView: UITableView!
    var menu = [(UIImage, String)]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        title = "Meun"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setMenu()
        setTableView()
    }

fileprivate func setTableView() {
    tableView.separatorInset = .zero
    tableView.contentInset = .zero
    tableView.tableFooterView = UIView()
    tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
}

fileprivate func setMenu() {
        menu = [
            (#imageLiteral(resourceName: "check-black-2"), "تسجيل الدخول"),
            (#imageLiteral(resourceName: "check-black-1"), "الخصوصية"),
            (#imageLiteral(resourceName: "check-black-2"), "عن نخبة الخصم"),
           
        ]
}
}
extension SideMenueViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "menuCell")
        cell.textLabel?.font = CairoFont.regular.with(size: 17)
        cell.textLabel?.text = menu[indexPath.row].1
        cell.imageView?.image = menu[indexPath.row].0.resizeImage(newSize: CGSize(width: 20, height: 20))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if let viewController = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        case 1:
            if let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "PrivacyViewController") as? PrivacyViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        case 2:
            if let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "AboutUsViewController") as? AboutUsViewController {
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }

        default:
            break
        }
    }
}

