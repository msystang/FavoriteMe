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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.imageActivityIndicator.startAnimating()
        
        let favoritableObject = favoritableObjects[indexPath.row]
        
        cell.titleLabel.text = favoritableObject.name
        cell.detailLabel.text = favoritableObject.details
        
        let urlStr = favoritableObject.photoUrl
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
        
        return cell
    }
    
    
}

extension SearchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SearchTableViewCell else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        detailsVC.selectedExperience = selectedExperience
        detailsVC.favoritableObject = favoritableObjects[indexPath.row]
        detailsVC.detailImage = cell.cellImageView.image

        self.present(detailsVC, animated: true, completion: nil)
        
    }
}
