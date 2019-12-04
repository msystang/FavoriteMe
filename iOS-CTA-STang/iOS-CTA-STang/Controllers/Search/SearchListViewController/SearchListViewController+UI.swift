//
//  SearchListViewController+UI.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

extension SearchListViewController {
    func styleObjects() {
        self.view.backgroundColor = #colorLiteral(red: 0.9672294259, green: 0.9228517413, blue: 0.9004820585, alpha: 1)
        UIDesign.styleNagivationBar(self.navigationController!.navigationBar)
        UIDesign.styleTableView(searchTableView)
        UIDesign.styleSearchBar(searchBar)
    }
    
    
    func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(searchTableView)
    }
    
    func addConstraints() {
        setSearchBarConstraints()
        setSearchTableViewConstraints()
    }
    
    private func setSearchBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func setSearchTableViewConstraints() {
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchTableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            searchTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            searchTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

