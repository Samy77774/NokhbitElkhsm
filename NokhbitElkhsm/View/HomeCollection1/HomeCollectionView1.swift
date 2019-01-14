//
//  HomeCollectionView1.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/14/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class HomeCollectionView1: UICollectionViewCell {
    @IBOutlet weak var Collection1Image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateViews(offer : Offer){
        Collection1Image.image = UIImage(named: offer.Collection1Image)
    }

}
