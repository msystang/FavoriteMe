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
    
    let unfavoritedButtonImage: UIImage? = UIImage(systemName: "heart")
    let favoritedButtonImage: UIImage? = UIImage(systemName: "heart.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        addSubviews()
        addConstraints()
    }

}
