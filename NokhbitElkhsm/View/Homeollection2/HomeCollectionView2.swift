//
//  HomeCollectionView2.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/14/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class HomeCollectionView2: UICollectionViewCell {
    @IBOutlet weak var Collection2Image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateViews(offer2 : Offer2){
        Collection2Image.image = UIImage(named: offer2.ImageName)
    }

}
