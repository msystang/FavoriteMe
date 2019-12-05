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
        //Check if already in favorites
        let favoritableObject = favoritableObjects[tag]
        var isFavorited: Bool = false
        
        favoritableObject.existsInFavorites(userID: currentUser.uid) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let isFavoritedFromFB):
                isFavorited = isFavoritedFromFB
                switch isFavorited {
                case false:
                    self?.saveFavoritableToFirestore(favoritableObject: favoritableObject)
                case true:
                    self?.deleteFavoritableFromFirebase(favoritableObject: favoritableObject)
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
    
    func deleteFavoritableFromFirebase(favoritableObject: Favoritable) {
        
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
