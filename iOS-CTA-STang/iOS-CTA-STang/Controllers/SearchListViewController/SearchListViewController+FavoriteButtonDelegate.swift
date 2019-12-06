//
//  SearchListViewController+SearchCellDelegate.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/5/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import UIKit

extension SearchListViewController: FavoriteButtonDelegate {
    //MARK: - SearchCellDelegate Functions
    func checkExistsInFavorites(tag: Int?, completion: () -> ()) {
        if let tag = tag {
            let favoritableObject = favoritableObjects[tag]
            
            
            favoritableObject.existsInFavorites(userID: currentUser.uid) { [weak self] (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let isFavoritedInFB):
                    let indexPath = IndexPath.init(row: tag, section: 0)
                    let cell = self?.searchTableView.cellForRow(at: indexPath) as! SearchTableViewCell
                    
                    switch isFavoritedInFB {
                    case false:
                        self?.saveFavoritableToFirestore(favoritableObject: favoritableObject)
                        //TODO: Refactor and add image setting in different func
                        cell.favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                    case true:
                        self?.deleteFavoritableFromFirebase(favoritableObject: favoritableObject)
                        cell.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                    }
                }
            }
            completion()
        }
    }

    func saveFavoritableToFirestore(favoritableObject: Favoritable) {
        let newFavorite = Favorite(creatorID: currentUser.uid, favoritableObject: favoritableObject)
        
        FirestoreService.manager.storeFavorite(favorite: newFavorite) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(()):
                print("Saved new favorite to Firestore")
            }
        }
    }
    
    func deleteFavoritableFromFirebase(favoritableObject: Favoritable) {
        let objectID = favoritableObject.id
        
        FirestoreService.manager.deleteFavorite(forUserID: currentUser.uid, objectID: objectID) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(()):
                print("Removed from favorites")
            }
        }
    }
    
//    func changeButtonAppearance(favoritableObject: Favoritable, isFavoritedInFB: Bool) {
        //        switch isFavoritedInFB {
        //        case true:
        //
        //        case false:
        //            //Change img
        //        }
//    }
    
    
}
