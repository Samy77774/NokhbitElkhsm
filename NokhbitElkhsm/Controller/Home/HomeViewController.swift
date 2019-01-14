//
//  HomeViewController.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/13/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var HomeCollection1: UICollectionView!
    @IBOutlet weak var HomeCollection2: UICollectionView!
    @IBOutlet weak var HomeCollection3: UICollectionView!
    @IBOutlet weak var HomeCollection4: UICollectionView!
    
    let types1 = [(#imageLiteral(resourceName: "1") ),(#imageLiteral(resourceName: "1") ),(#imageLiteral(resourceName: "1") ),(#imageLiteral(resourceName: "1") )]
    let types2 = [(#imageLiteral(resourceName: "5") ),(#imageLiteral(resourceName: "5") ),(#imageLiteral(resourceName: "5") ),(#imageLiteral(resourceName: "5") )]
    let types3 = [(#imageLiteral(resourceName: "2") , "احصل على 50% من قيمة مشترياتك من خلال الحصول على بطاقة الخصم"),(#imageLiteral(resourceName: "2") , "احصل على 50% من قيمة مشترياتك من خلال الحصول على بطاقة الخصم"),(#imageLiteral(resourceName: "2") , "احصل على 50% من قيمة مشترياتك من خلال الحصول على بطاقة الخصم")]
     let types4 = [(#imageLiteral(resourceName: "4") ),(#imageLiteral(resourceName: "4") ),(#imageLiteral(resourceName: "4") ),(#imageLiteral(resourceName: "4") )]
    
     private (set) public var offers = [Offer1]()
   private (set) public var offrs = [Offer2]()
    private (set) public var offr = [Offer3]()
    private (set) public var offs = [Offer4]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeCollection1.delegate = self
        HomeCollection1.dataSource = self
        HomeCollection2.delegate = self
        HomeCollection2.dataSource = self
        
 HomeCollection1.register(UINib(nibName: "HomeCollectionView1", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionView1")
        
         HomeCollection2.register(UINib(nibName: "HomeCollectionView2", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionView2")
        
         HomeCollection3.register(UINib(nibName: "HomeCollectionView3", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionView3")
        
         HomeCollection4.register(UINib(nibName: "HomeCollectionView4", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionView4")
    }
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return offers.count
        case 1:
            return offrs.count
        case 2:
            return offr.count
        case 3:
            return offs.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionView1", for: indexPath) as? HomeCollectionView1 else { return UICollectionViewCell() }
       cell.Collection1Image.image = types1[indexPath.item]
       //cell.updateViews(offer1: offers[indexPath.item])
        return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionView2", for: indexPath) as? HomeCollectionView2 else { return UICollectionViewCell() }
            cell.Collection2Image.image = types2[indexPath.item]
           //cell.updateViews(offer2: offrs[indexPath.item])
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionView3", for: indexPath) as? HomeCollectionView3 else { return UICollectionViewCell() }
            cell.Collection3Image.image = types3[indexPath.item].0
           // cell.updateViews(offer2: offrs[indexPath.item])
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionView4", for: indexPath) as? HomeCollectionView4 else { return UICollectionViewCell() }
            cell.Collection4Image.image = types4[indexPath.item]
            return cell
            
        default:
            return UICollectionViewCell()
    
        }
    }
}
