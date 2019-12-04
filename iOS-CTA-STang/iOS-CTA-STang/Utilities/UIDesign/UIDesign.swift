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
    static func styleLoginBackgroundColor(_ view: UIView) {
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.6588235294, blue: 0.5450980392, alpha: 1)
    }
    
    static func styleBackgroundColor(_ view: UIView) {
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9215686275, blue: 0.9019607843, alpha: 1)
    }
    
    static func styleTabBar(_ tabBar: UITabBar) {
        tabBar.tintColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.9568627451, green: 0.6588235294, blue: 0.5450980392, alpha: 1)
    }
    
    static func styleNagivationBar(_ navBar: UINavigationBar) {
        navBar.tintColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        navBar.barTintColor = #colorLiteral(red: 0.9568627451, green: 0.6588235294, blue: 0.5450980392, alpha: 1)
        let textAttributes = [
            NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.968627451, green: 0.9215686275, blue: 0.9019607843, alpha: 1),
            NSAttributedString.Key.font : UIFont(name: "AppleSDGothicNeo-Bold", size: 20)] as [NSAttributedString.Key : Any]
        navBar.titleTextAttributes = textAttributes
    }
    
    static func styleTableView(_ tableView: UITableView) {
        tableView.backgroundColor = .clear
    }
    
    static func styleSearchBar(_ searchBar: UISearchBar) {
        //TODO: Change color of cursor and cancel button to brown and add in UIDesign as style
        searchBar.searchTextField.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
        searchBar.searchTextField.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
    }
    
    static func styleTextField(_ textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        bottomLine.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.layer.addSublayer(bottomLine)
        textField.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
        textField.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
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
    
    //MARK: - Labels
    static func styleHeaderLabel(_ label: UILabel) {
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor: #colorLiteral(red: 0.968627451, green: 0.9215686275, blue: 0.9019607843, alpha: 1),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1),
            NSAttributedString.Key.strokeWidth: -2.0,
            NSAttributedString.Key.font : UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
            ] as [NSAttributedString.Key : Any]
        
        label.attributedText = NSMutableAttributedString(string: label.text!, attributes: strokeTextAttributes)
        
        label.textAlignment = .center
    }
    
    static func styleNameLabel(_ label: UILabel) {
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20)
    }
    
    static func styleDetailLabel(_ label: UILabel) {
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
    }
    
}
