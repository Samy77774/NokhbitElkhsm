//
//  Alert.swift
//  NokhbitElkhsm
//
//  Created by SAMY on 1/13/19.
//  Copyright © 2019 SAMY. All rights reserved.
//


import UIKit

class Alert {
    
    // show Alert with dismiss
    class func showAlertDismiss(target: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let colorNormal: UIColor = UIColor.black
        let titleFontAll: UIFont = CairoFont.regular.with(size: 16)
        alert.setValue(NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : colorNormal, NSAttributedString.Key.font: titleFontAll]), forKey: "attributedTitle")
        alert.setValue(NSAttributedString(string: message, attributes: [NSAttributedString.Key.foregroundColor : colorNormal, NSAttributedString.Key.font: CairoFont.regular.with(size: 13)]), forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        alert.view.tintColor = #colorLiteral(red: 0.4274509804, green: 0, blue: 0.4274509804, alpha: 1)
        target.present(alert, animated: true, completion: nil)
    }
    
    // Show Alert
    class func showAlert(target: UIViewController, title: String, message: String, okAction: String, cancel: String?, actionStyle: UIAlertAction.Style, actionCompletion: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let colorNormal: UIColor = UIColor.black
        let titleFontAll: UIFont = CairoFont.regular.with(size: 16)
        alert.setValue(NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : colorNormal, NSAttributedString.Key.font: titleFontAll]), forKey: "attributedTitle")
        alert.setValue(NSAttributedString(string: message, attributes: [NSAttributedString.Key.foregroundColor : colorNormal, NSAttributedString.Key.font: CairoFont.regular.with(size: 13)]), forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: okAction, style: actionStyle, handler: actionCompletion))
        if cancel != nil {
            alert.addAction(UIAlertAction(title: cancel, style: actionStyle, handler: nil))
        }
        alert.view.tintColor = #colorLiteral(red: 0.4274509804, green: 0, blue: 0.4274509804, alpha: 1) // Change Color
        target.present(alert, animated: true, completion: nil)
    }
    
}
