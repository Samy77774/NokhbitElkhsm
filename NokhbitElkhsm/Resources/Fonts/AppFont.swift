//
//  AppFont.swift
//  Jowan
//
//  Created by samy on 10/13/18.
//  Copyright © 2018 samy. All rights reserved.
//

import UIKit

enum CairoFont: String {
    
    case black = "Black"
    case bold = "Bold"
    case extraLight = "ExtraLight"
    case light = "Light"
    case regular = "Regular"
    case semiBold = "SemiBold"
    
    func with(size: CGFloat) -> UIFont {
        return UIFont(name: "Cairo-\(rawValue)", size: size)!
    }
}
