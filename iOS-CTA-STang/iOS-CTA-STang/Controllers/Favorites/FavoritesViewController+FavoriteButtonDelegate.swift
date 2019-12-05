//
//  FavoritesViewController+SearchCellDelegate.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/5/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

extension FavoritesViewController: FavoriteButtonDelegate {
    //MARK: - SearchCellDelegate Functions
    func checkExistsInFavorites(tag: Int?) {
        if let tag = tag {
            let favorite = favorites[tag]
            let objectID = favorite.objectID
            
            deleteFavoritableFromFirebase(objectID: objectID)
        }
    }
    
    func deleteFavoritableFromFirebase(objectID: String) {
        
        FirestoreService.manager.deleteFavorite(forUserID: FirebaseAuthService.manager.currentUser!.uid, objectID: objectID) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(()):
                print("Removed from favorites")
            }
        }
    }
    
//    func changeButtonAppearance() {
        //Make this property somewhere more global?
        //        switch isFavorited {
        //        case true:
        //            //Change img
        //            isFavorited = false
        //        case false:
        //            //Change img
        //            isFavorited = true
        //        }
//    }
    
}
