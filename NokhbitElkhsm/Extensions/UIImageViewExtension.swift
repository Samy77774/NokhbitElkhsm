//
//  UIImageViewExtension.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/13/19.
//  Copyright © 2019 SAMY. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageWith(_ linkString: String?)  {
        guard let linkString = linkString,
            let url = URL(string: linkString) else { return }
        self.kf.setImage(with: url)
    }
    
    func setImageWith(url: URL?) {
        guard let url = url else { return  }
        self.kf.setImage(with: url)
    }
}
