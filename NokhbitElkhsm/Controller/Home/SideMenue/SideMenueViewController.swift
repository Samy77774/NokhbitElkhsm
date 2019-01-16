//
//  SideMenueViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/16/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class SideMenueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }


}
