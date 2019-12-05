//
//  Favorite.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Favorite {
    let id: String
    let objectID: String
    let creatorID: String
    let name: String
    let details: String
    
    //Instatiating to 'encode' to Firestore
    init(objectID: String, creatorID: String, name: String, details: String) {
        self.id = UUID().description
        self.objectID = objectID
        self.creatorID = creatorID
        self.name = name
        self.details = details
    }
    
    //Instatiating when 'decoding' from Firestore
    init?(from dict: [String: Any], id: String) {
        guard let objectID = dict["objectID"] as? String,
        let userID = dict["creatorID"] as? String,
        let name = dict["name"] as? String,
        let details = dict["details"] as? String else { return nil }
        
        self.id = id
        self.objectID = objectID
        self.creatorID = userID
        self.name = name
        self.details = details
    }
    
    var fieldsDict: [String: Any] {
        return [
            "objectID": self.objectID,
            "creatorID": self.creatorID,
            "name": self.name,
            "details": self.details,
        ]
    }
    
    // Instantiating Favorite from Favoritable
    init(creatorID: String, favoritableObject: Favoritable) {
        self.id = UUID().description
        self.objectID = favoritableObject.id
        self.creatorID = creatorID
        self.name = favoritableObject.name
        self.details = favoritableObject.details
    }
}
