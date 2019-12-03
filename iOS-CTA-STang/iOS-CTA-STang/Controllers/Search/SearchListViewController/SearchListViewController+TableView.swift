//
//  SearchListViewController+TableView.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/3/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

extension SearchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedExperience != nil {
            switch selectedExperience! {
            case UserExperience.ticketMaster:
                return events.count
            case UserExperience.rijksmuseum:
                return museumItems.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        if selectedExperience != nil {
            switch selectedExperience! {
                
            case UserExperience.ticketMaster:
                let event = events[indexPath.row]
                
                cell.titleLabel.text = event.name
                
            case UserExperience.rijksmuseum:
                let museumItem = museumItems[indexPath.row]
                
                cell.titleLabel.text = museumItem.title
            }
        }
        
        return cell
    }
    
    
}

extension SearchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Segue to detailVC
    }
}
