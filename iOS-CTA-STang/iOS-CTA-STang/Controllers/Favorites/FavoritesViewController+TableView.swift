//
//  FavoritesViewController+TableView.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/5/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        let favorite = favorites[indexPath.row]
        
        //Cell Labels
        cell.titleLabel.text = favorite.name
        cell.detailLabel.text = favorite.details
        
        //Cell Image
        cell.imageActivityIndicator.startAnimating()
        
        let noImage = UIImage(named: "no-image")
        
        if let urlStr = favorite.photoUrl {
            ImageHelper.manager.getImage(urlStr: urlStr) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print(error)
                        cell.cellImageView.image = noImage
                        cell.imageActivityIndicator.isHidden = true
                    case .success(let imageFromOnline):
                        cell.cellImageView.image = imageFromOnline
                        cell.imageActivityIndicator.isHidden = true
                    }
                }
            }
        } else {
            cell.cellImageView.image = noImage
        }
        
        //Cell Delegation
        cell.favoriteButton.tag = indexPath.row
        cell.delegate = self
        
        return cell
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
