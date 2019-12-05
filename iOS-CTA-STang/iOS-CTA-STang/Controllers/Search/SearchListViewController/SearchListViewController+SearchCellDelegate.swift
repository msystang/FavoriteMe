//
//  SearchListViewController+SearchCellDelegate.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/5/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

extension SearchListViewController: SearchCellDelegate {
    //MARK: - SearchCellDelegate Functions
    func checkExistsInFavorites(tag: Int) {
        let favoritableObject = favoritableObjects[tag]
        let objectID = favoritableObject.id
        
        favoritableObject.existsInFavorites(userID: currentUser.uid) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let isFavoritedInFB):
                
                switch isFavoritedInFB {
                case false:
                    self?.saveFavoritableToFirestore(favoritableObject: favoritableObject)
                case true:
                    self?.deleteFavoritableFromFirebase(objectID: objectID)
                }
            }
        }
    }
    
    //TODO: Determine if these functions need to be in protocol
    func saveFavoritableToFirestore(favoritableObject: Favoritable) {
        let newFavorite = Favorite(creatorID: currentUser.uid, favoritableObject: favoritableObject)
        
        FirestoreService.manager.storeFavorite(favorite: newFavorite) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(()):
                print("Saved new favorite to Firestore")
                self?.changeButtonAppearance()
            }
        }
    }
    
    func deleteFavoritableFromFirebase(objectID: String) {
        
        FirestoreService.manager.deleteFavorite(forUserID: currentUser.uid, objectID: objectID) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(()):
                print("Removed from favorites")
            }
        }
    }
    
    func changeButtonAppearance() {
        //Make this property somewhere more global?
//        switch isFavorited {
//        case true:
//            //Change img
//            isFavorited = false
//        case false:
//            //Change img
//            isFavorited = true
//        }
    }

    
}
