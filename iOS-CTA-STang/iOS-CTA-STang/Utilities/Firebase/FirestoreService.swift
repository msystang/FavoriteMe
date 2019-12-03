//
//  FirestoreService.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

fileprivate enum FireStoreCollections: String {
    case users
    case favorites
}

class FirestoreService {
    static let manager = FirestoreService()
    
    private let db = Firestore.firestore()
    
    //MARK: Users
    func createUser(user: AppUser, completion: @escaping (Result<(), Error>) -> ()) {
        var fields = user.fieldsDict
        fields["dateCreated"] = Date()
        db.collection(FireStoreCollections.users.rawValue).document(user.uid).setData(fields) { (error) in
            if let error = error {
                completion(.failure(error))
                print(error)
            }
            completion(.success(()))
        }
    }
    
    func getCurrentUserInfo(user: User, completion: @escaping (Result<AppUser,Error>) -> ()) {
        db.collection(FireStoreCollections.users.rawValue).document(user.uid).getDocument { (snapshot, error) in
            
            if let error = error {
                completion(.failure(error))
            } else if let snapshot = snapshot,
                let data = snapshot.data() {
                let userID = snapshot.documentID
                let user = AppUser(from: data, id: userID)
                if let appUser = user {
                    completion(.success(appUser))
                }
            }
        }
    }
    
    //MARK: Favorites
    func storeFavorite(favorite: Favorite, completion: @escaping (Result<(), Error>) -> ()) {
        var fields = favorite.fieldsDict
        fields["dateCreated"] = Date()
        db.collection(FireStoreCollections.favorites.rawValue).addDocument(data: fields) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func getFavorites(forUserID: String, completion: @escaping (Result<[Favorite], Error>) -> ()) {
        db.collection(FireStoreCollections.favorites.rawValue).whereField("creatorID", isEqualTo: forUserID).getDocuments { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                let favorites = snapshot?.documents.compactMap({ (snapshot) -> Favorite? in
                    let favoriteID = snapshot.documentID
                    let favorite = Favorite(from: snapshot.data(), id: favoriteID)
                    return favorite
                })
                completion(.success(favorites ?? []))
            }
        }
        
    }
    
    func removeFavorite() {
        //TODO: Create removeFavorite func by updating isFavorite property
    }
    
    private init () {}
}
