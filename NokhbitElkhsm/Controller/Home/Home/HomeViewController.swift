//
//  HomeViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/13/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var menu = [(UIImage, String)]()
    @IBOutlet weak var LeadingConstraints: NSLayoutConstraint!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var MenuView: UIView!
    var MenuShowing = false
    var types1 = [(#imageLiteral(resourceName: "1") ),(#imageLiteral(resourceName: "1") ),(#imageLiteral(resourceName: "1") ),(#imageLiteral(resourceName: "1") )]
    var types2 = [(#imageLiteral(resourceName: "5") ),(#imageLiteral(resourceName: "5") ),(#imageLiteral(resourceName: "5") ),(#imageLiteral(resourceName: "5") )]
   var types3 = [(#imageLiteral(resourceName: "2") ),(#imageLiteral(resourceName: "2") ),(#imageLiteral(resourceName: "2") )]
     var types4 = [(#imageLiteral(resourceName: "4") ),(#imageLiteral(resourceName: "4") ),(#imageLiteral(resourceName: "4") ),(#imageLiteral(resourceName: "4") )]
    var types5 = [("احصل على 50% من قيمة مشترياتك من خلال الحصول على بطاقة الخصم"),("احصل على 50% من قيمة مشترياتك من خلال الحصول على بطاقة الخصم"),("احصل على 50% من قيمة مشترياتك من خلال الحصول على بطاقة الخصم")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomNavigation()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        //ScrollView.showsHorizontalScrollIndicator = false//to disable HorizontalScrollIndicator
        //ScrollView.showsVerticalScrollIndicator = false
        MenuView.layer .shadowOpacity = 1
        MenuView.layer.shadowRadius = 6
        setMenu()
        setTableView()
    }
    //Mark:- TableView in menue
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
    let searchBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
    searchBtn.setImage(UIImage(named: "search-btn"), for: [])
    searchBtn.addTarget(self, action: #selector(SearchAction), for: UIControl.Event.touchUpInside)
    searchBtn.frame = CGRect(x: -30, y: 0, width: 30, height: 30)
    let searchButton = UIBarButtonItem(customView: searchBtn)
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    let Menu: UIButton = UIButton(type: UIButton.ButtonType.custom)
    Menu.setImage(UIImage(named: "side-nav-btn"), for: [])
    Menu.addTarget(self, action: #selector(SideMenu), for: UIControl.Event.touchUpInside)
    Menu.frame = CGRect(x: -40, y: 0, width: 30, height: 30)
    let MenueButton = UIBarButtonItem(customView: Menu)
    self.navigationItem.setLeftBarButtonItems([MenueButton,homeButton,searchButton], animated: true)
    
}
    @objc func homeAction(){
        let sb: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier:"HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func SearchAction(){
        let sb: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier:"SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //Mark Custom Menue
    @IBAction func BtnCloseMenuu(_ sender: Any) {
        if (MenuShowing){
            LeadingConstraints.constant = -290
        }else{
            LeadingConstraints.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        }
        
        MenuShowing = !MenuShowing
    }
    
    @IBAction func SideMenu() {
        if (MenuShowing){
            LeadingConstraints.constant = -290
        }else{
            LeadingConstraints.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        }
        
        MenuShowing = !MenuShowing
    }
    
}



//MarK:- making Custom Collection
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return types1.count
        case 1:
            return types2.count
        case 2:
            return types3.count
        case 3:
            return types4.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionView1", for: indexPath) as? HomeCollectionView1 else { return UICollectionViewCell() }
            cell.CollectionImage1.image = types1[indexPath.row]
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionView2", for: indexPath) as? HomeCollectionView2 else { return UICollectionViewCell() }
            cell.CollectionImage2.image = types2[indexPath.row]
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionView3", for: indexPath) as? HomeCollectionView3 else { return UICollectionViewCell() }
           cell.CollectionImage3.image = types3[indexPath.row]
            cell.CollectionTable.text = types5[indexPath.row]
            
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionView4", for: indexPath) as? HomeCollectionView4 else { return UICollectionViewCell() }
            cell.CollectionImage4.image = types4[indexPath.row]
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}


///Mark:- Custo Menue (Using TableView)
    extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
        
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
        func men(){
            
        }
}



    













