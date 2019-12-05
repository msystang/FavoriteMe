//
//  DetailsViewController+FavoriteButtonDelegate.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/5/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

extension DetailsViewController: FavoriteButtonDelegate {
    //MARK: - SearchCellDelegate Functions
    func checkExistsInFavorites(tag: Int?) {
        
        favoritableObject.existsInFavorites(userID: FirebaseAuthService.manager.currentUser!.uid) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let isFavoritedInFB):
                
                switch isFavoritedInFB {
                case false:
                    self?.saveFavoritableToFirestore(favoritableObject: self!.favoritableObject)
                case true:
                    self?.deleteFavoritableFromFirebase(favoritableObject: self!.favoritableObject)
                }
                self?.changeButtonAppearance(favoritableObject: self!.favoritableObject, isFavoritedInFB: isFavoritedInFB)
            }
        }
    }
    
    //TODO: Determine if these functions need to be in protocol
    func saveFavoritableToFirestore(favoritableObject: Favoritable) {
        let newFavorite = Favorite(creatorID: FirebaseAuthService.manager.currentUser!.uid, favoritableObject: favoritableObject)
        
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
        
        FirestoreService.manager.deleteFavorite(forUserID: FirebaseAuthService.manager.currentUser!.uid, objectID: objectID) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(()):
                print("Removed from favorites")
            }
        }
    }
    
    func changeButtonAppearance(favoritableObject: Favoritable, isFavoritedInFB: Bool) {
//        switch isFavoritedInFB {
//        case true:
//
//        case false:
//            //Change img
//        }
    }

    
}

