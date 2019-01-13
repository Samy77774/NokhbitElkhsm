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
        self.presentDetails(viewControllerToPresent: Storyboard.Home.instantiate(HomeViewController.self))
        
        
    }
    
    @IBAction func SkipRegister(_ sender: Any) {
        self.navigationController?.pushViewController(Storyboard.Authentication.instantiate(RegisterViewController.self), animated: true)
    }
    
    
    @IBAction func ForgetPassword(_ sender: Any) {
        self.navigationController?.pushViewController(Storyboard.Authentication.instantiate(ForgetPasswordViewController.self), animated: true)
    }
    
}
