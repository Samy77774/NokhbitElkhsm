//
//  Dashboard1ViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/17/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class Dashboard1ViewController: UIViewController {
    var newProduct = [ "منتج جديد", "منتج جديد","منتج جديد","منتج جديد","منتج جديد","منتج جديد"]
@IBOutlet weak var DashBoardMenue: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "الداش بورد"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    CustomNavigation()
    
    }
    
    //MarK:- Custom Navigation
    func CustomNavigation (){
        let imageView = UIImageView(image: UIImage(named: "icon"))
        let item = UIBarButtonItem(customView: imageView)
        self.navigationItem.rightBarButtonItem = item
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        let homeBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        homeBtn.setImage(UIImage(named: "home-btn"), for: [])
        homeBtn.addTarget(self, action: #selector(homeAction), for: UIControl.Event.touchUpInside)
        homeBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let homeButton = UIBarButtonItem(customView: homeBtn)
        /////////////////////////////////////////////////////////////////////////////////////////////////
        let backBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        backBtn.setImage(UIImage(named: "search-btn"), for: [])
        backBtn.addTarget(self, action: #selector(backAction), for: UIControl.Event.touchUpInside)
        backBtn.frame = CGRect(x: -30, y: 0, width: 30, height: 30)
        let backButton = UIBarButtonItem(customView: backBtn)
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        let Menu: UIButton = UIButton(type: UIButton.ButtonType.custom)
        Menu.setImage(UIImage(named: "side-nav-btn"), for: [])
        Menu.addTarget(self, action: #selector(SideMenu), for: UIControl.Event.touchUpInside)
        Menu.frame = CGRect(x: -50, y: 0, width: 30, height: 30)
        let MenueButton = UIBarButtonItem(customView: Menu)
        self.navigationItem.setLeftBarButtonItems([MenueButton,homeButton,backButton], animated: true)
        
    }
    
    @objc func homeAction(){
        let sb: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier:"HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func backAction(){
        let sb: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier:"SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func SideMenu(){
        print("gooooo")
    }
    
}


extension Dashboard1ViewController: UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashBoard1Cell", for: indexPath) as? DashBoard1Cell else { return UITableViewCell() }
    cell.NewProduct.text = newProduct[indexPath.row]
//    cell.PriceLable.text = newProduct[indexPath.row]
//    cell.PercentageRate.text = newProduct[indexPath.row]
    return cell
}
}
