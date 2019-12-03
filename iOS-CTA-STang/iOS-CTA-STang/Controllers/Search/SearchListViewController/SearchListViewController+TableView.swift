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
        cell.imageActivityIndicator.startAnimating()
        
        if selectedExperience != nil {
            switch selectedExperience! {
                
            case UserExperience.ticketMaster:
                let event = events[indexPath.row]
                
                //TODO: Use formatted Date
                cell.titleLabel.text = event.name
                cell.detailLabel.text = event.dates.start.dateTime
                
                //TODO: load image as own func?
                let urlStr = event.images[3].url
                
                ImageHelper.manager.getImage(urlStr: urlStr) { (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .failure(let error):
                            print(error)
                            //TODO: Load default image
                            cell.imageActivityIndicator.isHidden = true
                        case .success(let imageFromOnline):
                            cell.cellImageView.image = imageFromOnline
                            cell.imageActivityIndicator.isHidden = true
                        }
                    }
                }
                
            case UserExperience.rijksmuseum:
                let museumItem = museumItems[indexPath.row]
                
                cell.titleLabel.text = museumItem.title
                cell.detailLabel.text = museumItem.principalOrFirstMaker
                
                //TODO: load image as own func?
                let urlStr = museumItem.webImage.url
                
                ImageHelper.manager.getImage(urlStr: urlStr) { (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .failure(let error):
                            print(error)
                            //TODO: Load default image
                            cell.imageActivityIndicator.isHidden = true
                        case .success(let imageFromOnline):
                            cell.cellImageView.image = imageFromOnline
                            cell.imageActivityIndicator.isHidden = true
                        }
                    }
                }
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
