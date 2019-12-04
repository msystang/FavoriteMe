//
//  FavoritesViewController+UI.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

extension FavoritesViewController {
    func styleObjects() {
        UIDesign.styleBackgroundColor(self.view)
        UIDesign.styleNagivationBar(self.navigationController!.navigationBar)
    }
    
    func addSubviews() {
        view.addSubview(favoritesTableView)
    }
    
    func addConstraints() {
        setFavoritesTableViewConstraints()
    }
    
    private func setFavoritesTableViewConstraints() {
        favoritesTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoritesTableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            favoritesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favoritesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

