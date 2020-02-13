//
//  User.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct AppUser {
    let email: String?
    let uid: String
    let selectedExperience: String?
    let dateCreated: Date?
    
    //Instatiating to 'encode' to Firestore
    init(from user: User, selectedExperience: UserExperience) {
        self.email = user.email
        self.uid = user.uid
        self.selectedExperience = selectedExperience.rawValue
        self.dateCreated = user.metadata.creationDate
    }
    
    //Instatiating when 'decoding' from Firestore
    init?(from dict: [String: Any], id: String) {
        guard let email = dict["email"] as? String,
            let selectedExperience = dict["selectedExperience"] as? String,
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }
        
        self.uid = id
        self.email = email
        self.selectedExperience = selectedExperience
        self.dateCreated = dateCreated
    }
    
    var fieldsDict: [String: Any] {
        return [
            "email": self.email ?? "",
            "selectedExperience": self.selectedExperience ?? UserExperience.ticketMaster.rawValue
        ]
    }
}
