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
