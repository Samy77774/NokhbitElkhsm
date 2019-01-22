//
//  TabBarViewController1.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/17/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class TabBarViewController1: UITabBarController {

    let userType = UserDefaults.standard.string(forKey: "userType")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        setTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    // Set Tab Bar
    private func setTabBarItems(item: Int, title: String) {
        self.tabBar.items![item].title = title
    }
    
    private func setTabBar() {
        switch userType {
        case "0":
            self.setTabBarItems(item: 0, title: "الرئيسية")
         self.setTabBarItems(item: 1,  title: "الباركود")
         self.setTabBarItems(item: 2,  title: "الداش بورد")
            default:
                self.setTabBarItems(item: 0, title: "الرئيسية")
                self.setTabBarItems(item: 1,  title: "الباركود")
                self.setTabBarItems(item: 2,  title: "الداش بورد")
        }
    }

    // Set ViewControllers
    func setViewControllers() {
        var controllers: [UIViewController]!
        switch userType {
        case "0":
            let sb = UIStoryboard(name: "Home", bundle: nil)
            let home = sb.instantiateViewController(withIdentifier:"SWRevealViewController")
            
            let bk = UIStoryboard(name: "Home", bundle: nil)
            let bar = bk.instantiateViewController(withIdentifier:"BarCode1ViewController")
            
            
            
            let sd = UIStoryboard(name: "Home", bundle: nil)
            let dash = sd.instantiateViewController(withIdentifier:"Dashboard1ViewController")
            controllers = [home, bar, dash]
        default:
            let sb = UIStoryboard(name: "Home", bundle: nil)
            let home = sb.instantiateViewController(withIdentifier:"SWRevealViewController")
            
            let bk = UIStoryboard(name: "Home", bundle: nil)
            let bar = bk.instantiateViewController(withIdentifier:"BarCode1ViewController")
            
            let sd = UIStoryboard(name: "Home", bundle: nil)
            let dash = sd.instantiateViewController(withIdentifier:"Dashboard1ViewController")
           
            controllers = [home, bar, dash]
        }
      self.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
    }
}










    
//    // Set ViewControllers
//    func setViewControllers() {
//        var controllers: [UIViewController]!
//        switch userType {
//        case "0":
//            let vc = UIStoryboard(name: "Home", bundle: nil)
//            let home = vc.instantiateViewController(withIdentifier:"HomeCompanyViewController") as?
//        HomeCompanyViewController
//            if let navigator = navigationController {
//                navigator.pushViewController(home!, animated: true)
//            }
//            let vc1 = UIStoryboard(name: "Home", bundle: nil)
//            let Barcode = vc1.instantiateViewController(withIdentifier:"BarCode1ViewController") as?
//        BarCode1ViewController
//            if let navigator = navigationController {
//                navigator.pushViewController(Barcode!, animated: true)
//            }
//            let vc2 = UIStoryboard(name: "Home", bundle: nil)
//            let Dashboard = vc2.instantiateViewController(withIdentifier:"Dashboard1ViewController")as?
//        Dashboard1ViewController
//            if let navigator = navigationController {
//                navigator.pushViewController(Dashboard!, animated: true)
//            }
//        default:
//            let vc = UIStoryboard(name: "Home", bundle: nil)
//            let home = vc.instantiateViewController(withIdentifier:"HomeCompanyViewController") as?
//            HomeCompanyViewController
//            if let navigator = navigationController {
//                navigator.pushViewController(home!, animated: true)
//            }
//            let vc1 = UIStoryboard(name: "Home", bundle: nil)
//            let Barcode = vc1.instantiateViewController(withIdentifier:"BarCode1ViewController") as?
//            BarCode1ViewController
//            if let navigator = navigationController {
//                navigator.pushViewController(Barcode!, animated: true)
//            }
//            let vc2 = UIStoryboard(name: "Home", bundle: nil)
//            let Dashboard = vc2.instantiateViewController(withIdentifier:"Dashboard1ViewController")as?
//            Dashboard1ViewController
//            if let navigator = navigationController {
//                navigator.pushViewController(Dashboard!, animated: true)
//            }
//
//            controllers = ([home, Barcode, Dashboard] as! [UIViewController])
//        }
//      self.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
//    }
//}


