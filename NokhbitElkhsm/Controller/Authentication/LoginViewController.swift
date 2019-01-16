//
//  LoginViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/13/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "تسجيل الدخول"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)    }
    
    @IBAction func Skip(_ sender: Any) {
        let sb = UIStoryboard(name: "Home", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier:"SWRevealViewController")
        self.presentDetails(viewControllerToPresent: (vc))
    }
    
    @IBAction func SkipRegister(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    
    @IBAction func ForgetPassword(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "ForgetPasswordViewController") as? ForgetPasswordViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
}
