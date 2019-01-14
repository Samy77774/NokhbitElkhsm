//
//  HomeCollectionView4.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/14/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class HomeCollectionView4: UICollectionViewCell {
 @IBOutlet weak var Collection4Image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateViews(offer4 : Offer4){
        Collection4Image.image = UIImage(named: offer4.ImageName)
    }

}
