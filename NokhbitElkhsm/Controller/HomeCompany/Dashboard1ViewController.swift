//
//  Dashboard1ViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/17/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class Dashboard1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }


}
