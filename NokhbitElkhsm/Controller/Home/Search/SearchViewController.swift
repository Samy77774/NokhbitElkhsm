//
//  SearchViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/15/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "صفحة البحث"
        //Left
        let LeftButton = UIBarButtonItem (title: "left", style: .plain, target: HomeViewController.self, action: nil)
      //  let LeftButton = UIBarButtonItem(title: "left", style: .plain, target: vc, action: nil);)
        navigationItem.leftBarButtonItem = LeftButton
        
    }
    
    
}


