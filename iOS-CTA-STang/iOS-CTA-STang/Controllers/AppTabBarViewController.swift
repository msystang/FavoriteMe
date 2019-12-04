//
//  AppTabBarController.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class AppTabBarViewController: UITabBarController {
    
    //MARK: - UI Objects
    lazy var searchListVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: SearchListViewController())
        return navController
    }()
    
    lazy var favoritesVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: FavoritesViewController())
        return navController
    }()
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchListVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.circle"), tag: 1)
        self.viewControllers = [searchListVC, favoritesVC]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.tabBar.tintColor = #colorLiteral(red: 0.9568627451, green: 0.6588235294, blue: 0.5450980392, alpha: 1)
    }
    
}
