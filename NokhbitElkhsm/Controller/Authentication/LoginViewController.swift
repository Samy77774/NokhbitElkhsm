//
//  LoginViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/13/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import FacebookCore
import FBSDKShareKit
import FBSDKCoreKit

class LoginViewController: UIViewController {
    
    
    ////////Login in face
   // @IBOutlet weak var Faceinfo: UILabel!
    @IBAction func LoginPressed(_ sender: UIButton) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self){ result in
            switch result {
            case .failed(let error):
                print(error.localizedDescription)
            case .cancelled:
                print("User cancelled login.")
            case .success(_,_,_):
                self.getUserInfo { userInfo, error in
                    if let error = error { print (error.localizedDescription)}
                    if let userInfo = userInfo, let id = userInfo ["id"], let name = userInfo["name"], let email = userInfo["email"]{
                       // self.Faceinfo.text = "ID: \(id), name: \(name), email: \(email)"
                    }
                    // if let userInfo = userInfo, let pictuerurl = (userInfo ["picture"] as? [String:Any])
                }
            }
 
        }
    }
    func getUserInfo(completion:@escaping (_ :[String: Any]?, _ :Error?) ->Void ){
        let request = GraphRequest(graphPath: "me", parameters: ["feilds":"id,name,email,picture"])
        request.start {response, result in
            switch result {
            case.failed (let error):
                completion (nil, error)
            case.success(let graphResponse):
                completion (graphResponse.dictionaryValue,nil)
                
            }
        }
    }
    

/////////////////////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "تسجيل الدخول"
      navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    @IBAction func Skip(_ sender: Any) {
        
//        // go to tabBar
               let sb = UIStoryboard(name: "Home", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier:"TabBarViewController1")
                if let navigator = navigationController {
                    navigator.pushViewController(vc, animated: true)
                }
        
        // go to Main Home

//       let sb = UIStoryboard(name: "Home", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier:"SWRevealViewController")
//        if let navigator = navigationController {
//            navigator.pushViewController(vc, animated: true)
//        }
        
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
