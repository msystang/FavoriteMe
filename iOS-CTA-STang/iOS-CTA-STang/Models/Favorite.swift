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
    let creatorID: String
    let title: String
    let details: String
    let isFavorite: Bool
    let dateCreated: Date?
    
    //Instatiating to 'encode' to Firestore
    init(creatorID: String, title: String, details: String, isFavorite: Bool = true, dateCreated: Date? = nil) {
        self.id = UUID().description
        self.creatorID = creatorID
        self.title = title
        self.details = details
        self.isFavorite = isFavorite
        self.dateCreated = dateCreated
    }
    
    //Instatiating when 'decoding' from Firestore
    init?(from dict: [String: Any], id: String) {
        guard let userID = dict["creatorID"] as? String,
        let title = dict["title"] as? String,
        let details = dict["details"] as? String,
        let isFavorite = dict["isFavorite"] as? Bool else { return nil }
        let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue()
        
        self.id = id
        self.creatorID = userID
        self.title = title
        self.details = details
        self.isFavorite = isFavorite
        self.dateCreated = dateCreated
    }
    
    var fieldsDict: [String: Any] {
        return [
            "creatorID": self.creatorID,
            "title": self.title,
            "details": self.details,
            "isFavorite": self.isFavorite
        ]
    }
    
    // Instantiating Favorite from Event
    init(creatorID: String, event: Event, isFavorite: Bool = true, dateCreated: Date? = nil) {
        self.id = UUID().description
        self.creatorID = creatorID
        self.title = event.name
        self.details = event.dates.start.formattedDate
        self.isFavorite = isFavorite
        self.dateCreated = dateCreated
    }
    
    // Instantiating Favorite from MuseumItem
    init(creatorID: String, museumItem: MuseumItem, isFavorite: Bool = true, dateCreated: Date? = nil) {
        self.id = UUID().description
        self.creatorID = creatorID
        self.title = museumItem.title
        self.details = museumItem.principalOrFirstMaker
        self.isFavorite = isFavorite
        self.dateCreated = dateCreated
    }
    
}
