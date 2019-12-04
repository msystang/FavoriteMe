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
    
    //Event properties
    var isEvent: Bool? { get }
    var eventName: String? { get }
    var eventTimeDate: String? { get }
    var eventPrice: String? { get }
    var eventLink: String? { get }
    
    //MuseumItem properties
    var isMuseumItem: Bool? { get }
    var itemName: String? { get }
    var itemDescription: String? { get }
    var itemDateCreated: String? { get }
    var itemPlaceProduced: String? { get }
    
}
