//
//  HomeViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/13/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ScrollView: UIScrollView!
    var types1 = [(#imageLiteral(resourceName: "1") ),(#imageLiteral(resourceName: "1") ),(#imageLiteral(resourceName: "1") ),(#imageLiteral(resourceName: "1") )]
    var types2 = [(#imageLiteral(resourceName: "5") ),(#imageLiteral(resourceName: "5") ),(#imageLiteral(resourceName: "5") ),(#imageLiteral(resourceName: "5") )]
   var types3 = [(#imageLiteral(resourceName: "2") ),(#imageLiteral(resourceName: "2") ),(#imageLiteral(resourceName: "2") )]
     var types4 = [(#imageLiteral(resourceName: "4") ),(#imageLiteral(resourceName: "4") ),(#imageLiteral(resourceName: "4") ),(#imageLiteral(resourceName: "4") )]
    var types5 = [("احصل على 50% من قيمة مشترياتك من خلال الحصول على بطاقة الخصم"),("احصل على 50% من قيمة مشترياتك من خلال الحصول على بطاقة الخصم"),("احصل على 50% من قيمة مشترياتك من خلال الحصول على بطاقة الخصم")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomNavigation()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        ScrollView.showsHorizontalScrollIndicator = false//to disable HorizontalScrollIndicator
        ScrollView.showsVerticalScrollIndicator = false
        
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












