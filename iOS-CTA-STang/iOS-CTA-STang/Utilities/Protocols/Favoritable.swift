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
    var photoUrl: String { get }
    var name: String { get }
    var details: String { get } // DateCreated for MuseumItem, Price for Event
    
    //Event properties
    var isEvent: Bool? { get }
    var eventTimeDate: String? { get }
    var eventLink: String? { get }
    
    //MuseumItem properties
    var isMuseumItem: Bool? { get }
    var itemDescription: String? { get }
    var itemPlaceProduced: String? { get }
    
}
