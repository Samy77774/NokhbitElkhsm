//
//  HomeCollectionView3.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/14/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit

class HomeCollectionView3: UICollectionViewCell {
    @IBOutlet weak var Collection3Image: UIImageView!
    @IBOutlet weak var DescripImage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(offer3 : Offer3){
        Collection3Image.image = UIImage(named: offer3.imageName)
        DescripImage.text = offer3.title
    }

}
