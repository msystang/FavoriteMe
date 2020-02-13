//
//  Favoritable.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/4/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation

public protocol Favoritable {
    var id: String { get }
    var photoUrl: String? { get }
    var name: String { get }
    var details: String { get } // location for MuseumItem, date for Event
    
    //Event properties
    var isEvent: Bool? { get }
    var eventPrice: String? { get }
    var eventLink: String? { get }
    
    //MuseumItem properties
    var isMuseumItem: Bool? { get }
    
    func existsInFavorites(userID: String, completion: @escaping (Result<Bool, Error>) -> ())
}
