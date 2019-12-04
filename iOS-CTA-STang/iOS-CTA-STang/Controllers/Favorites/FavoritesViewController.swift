//
//  FavoriteViewController.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    lazy var favoritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        //TODO: Set delegate/Datasource
        return tableView
    }()
    
    lazy var signOutButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "person.crop.circle.fill.badge.xmark")
        //TODO: Add target action
        return barButton
    }()
    
    let unfavoritedButtonImage: UIImage? = UIImage(systemName: "heart")
    let favoritedButtonImage: UIImage? = UIImage(systemName: "heart.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        //TODO: Set Title
        navigationItem.rightBarButtonItem = signOutButton
        
        addSubviews()
        addConstraints()
    }

}
