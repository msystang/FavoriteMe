//
//  UIDesign.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

struct UIDesign {
    //TODO: Make background a gradient?
    
    static func styleNagivationBar(_ navBar: UINavigationBar) {
        navBar.tintColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)]
        navBar.titleTextAttributes = textAttributes
    }
    
    static func styleTextField(_ textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        bottomLine.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.layer.addSublayer(bottomLine)
    }
    
    static func styleButton(_ button: UIButton) {
        button.backgroundColor = .clear
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 15.0
        button.tintColor = UIColor.white
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.showsTouchWhenHighlighted = true
    }
    
    //TODO: Put this to use for login/create account
    static func styleButtonInactive(_ button: UIButton) {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25.0
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        button.tintColor = UIColor.black
    }
    
    static func styleNameLabel(_ label: UILabel) {
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
    }
    
    static func styleDetailLabel(_ label: UILabel) {
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
    }
    
}
