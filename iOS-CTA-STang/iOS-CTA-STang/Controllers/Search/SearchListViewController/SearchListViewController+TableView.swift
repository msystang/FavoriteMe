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
                cell.detailLabel.text = event.details
                
                //TODO: load image as own func?
                let urlStr = event.photoUrl
                
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
                
                cell.titleLabel.text = museumItem.name
                cell.detailLabel.text = museumItem.details
                
                //TODO: load image as own func?
                let urlStr = museumItem.photoUrl
                
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
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        detailsVC.selectedExperience = selectedExperience
        
        if selectedExperience != nil {
            switch selectedExperience! {
            case UserExperience.ticketMaster:
                detailsVC.event = events[indexPath.row]
            case UserExperience.rijksmuseum:
                detailsVC.museumItem = museumItems[indexPath.row]
            }
        }
        
        self.present(detailsVC, animated: true, completion: nil)
        
    }
}
