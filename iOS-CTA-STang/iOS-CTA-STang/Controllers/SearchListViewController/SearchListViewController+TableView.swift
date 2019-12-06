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
        return favoritableObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        let favoritableObject = favoritableObjects[indexPath.row]
        
        //Cell Labels
        cell.titleLabel.text = favoritableObject.name
        cell.detailLabel.text = favoritableObject.details
        
        //Cell Image
        //TODO: Cache images to be loaded in DetailVC and FavoritesVC
        cell.imageActivityIndicator.startAnimating()
        let noImage = UIImage(named: "no-image")
        if let urlStr = favoritableObject.photoUrl {
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
        
        //Cell Button
        favoritableObject.existsInFavorites(userID: currentUser.uid) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let isFavoritedInFB):
                switch isFavoritedInFB {
                case true:
                    cell.favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                case false:
                    cell.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                }
            }
        }
        
        //Cell Delegation
        cell.favoriteButton.tag = indexPath.row
        cell.delegate = self
        
        return cell
    }
    
    
}

extension SearchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SearchTableViewCell else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        detailsVC.selectedExperience = selectedExperience
        detailsVC.favoritableObject = favoritableObjects[indexPath.row]
        detailsVC.detailImage = cell.cellImageView.image
        detailsVC.title = "Details"
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }
}
