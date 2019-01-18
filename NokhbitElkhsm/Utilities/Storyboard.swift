//
//  Storyboard.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/13/19.
//  Copyright © 2019 SAMY. All rights reserved.
//
import UIKit

public enum Storyboard: String {
    case Authentication
    case Home
    
    public func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        
        // Language
        var detectLang: String!
        
        let path = Bundle.main.path(forResource: detectLang , ofType: "lproj")
        let bundd = Bundle.init(path: path!)
        
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: bundd)
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        return vc
        
    }
}
