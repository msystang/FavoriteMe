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
    
    static func styleButtonPressed(_ button: UIButton) {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25.0
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        button.tintColor = UIColor.black
    }
}
